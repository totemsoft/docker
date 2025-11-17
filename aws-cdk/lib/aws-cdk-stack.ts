import { CfnParameter, Duration, Stack, StackProps } from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { AwsLogDriver, Cluster, ContainerDefinition, ContainerImage, FargateTaskDefinition } from 'aws-cdk-lib/aws-ecs';
import { ApplicationLoadBalancedFargateService } from 'aws-cdk-lib/aws-ecs-patterns';
import { ApplicationProtocol, Protocol } from 'aws-cdk-lib/aws-elasticloadbalancingv2';
import { HostedZone } from 'aws-cdk-lib/aws-route53';
import { EnvironmentUtils } from './include/environment-utils';
import { PolicyStatement } from 'aws-cdk-lib/aws-iam';
//import { Bucket } from 'aws-cdk-lib/aws-s3';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import { Certificate, CertificateValidation } from 'aws-cdk-lib/aws-certificatemanager';
import { MysqlInstance } from './include/mysql';
import { AuroraMysqlInstance } from './include/aurora';

export interface AwsCdkStackProps extends StackProps {

  /**
   * The zone domain e.g. example.com
   * @type {string}
   * @memberof AwsCdkStackProps
   */
  readonly domainName: string;

  /**
   * Migrate data from /db/migration/data folder.
   * @type {boolean}
   * @memberof AwsCdkStackProps
   * @default false
   */
  readonly flywayMigrateData?: boolean;

  /**
   * The name or Amazon Resource Name (ARN) of the DB snapshot that's used to
   * restore the DB instance. If you're restoring from a shared manual DB
   * snapshot, you must specify the ARN of the snapshot.
   * @memberof AwsCdkStackProps
   * @default arn:aws:rds:${CDK_DEFAULT_REGION}:${CDK_DEFAULT_ACCOUNT}:snapshot:elixir-xir-final
   */
  readonly snapshotIdentifier0?: string;
  readonly snapshotIdentifier?: string;

}

export class AwsCdkStack extends Stack {
  constructor(scope: Construct, id: string, props: AwsCdkStackProps) {
    super(scope, id, props);

/*
    // TODO: cdk deploy xcelerate --parameters domainName=elixirlegal.com
    const domainNameParameter = new CfnParameter(this, 'domainName', {
      type: 'String',
      description: 'The zone domain e.g. example.com'
    });
    const domainName = domainNameParameter.valueAsString;
//*/
    const domainName = props.domainName;

    const vpc = new ec2.Vpc(this, `${id}Vpc`, {
      //maxAzs: 3
    });

    const vpcSubnets: ec2.SubnetSelection = {
      //onePerAz: true,
      //availabilityZones: ['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c'],
      subnetType: ec2.SubnetType.PUBLIC
    };

    const rdsInstance0 = new MysqlInstance(this, id, {
      env: { region: this.region },
      description: `${id} Mysql`,
      vpc,
      vpcSubnets,
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.SMALL),
      deletionProtection: false, // props.terminationProtection,
      dbUsername: `${id}`,
      dbName: `${id}`,
      snapshotIdentifier: props.snapshotIdentifier0,
    });
    const rdsInstance = new AuroraMysqlInstance(this, id, {
      env: { region: this.region },
      description: `${id} Aurora Mysql`,
      vpc,
      vpcSubnets,
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MEDIUM),
      deletionProtection: props.terminationProtection,
      dbUsername: `${id}`,
      dbName: `${id}`,
      snapshotIdentifier: props.snapshotIdentifier,
    });

    const cluster = new Cluster(this, `${id}Cluster`, {
      vpc
    });

    const taskDef = new FargateTaskDefinition(this, `${id}TaskDefinition1`, {
      cpu: 1024,
      memoryLimitMiB: 2048
    });
    taskDef.addToTaskRolePolicy(new PolicyStatement( {
        actions: [
            'cognito-idp:Admin*',
            's3:*',
            'ses:*'
        ],
        resources: ['*']
    }));

    // create a task definition with CloudWatch Logs
    const logDriver = new AwsLogDriver({
      streamPrefix: `ecs-${id}`
    });
    const containerDef = new ContainerDefinition(this, `${id}ContainerDefinition`, {
      image: ContainerImage.fromRegistry('totemsoft/wildfly-elixir'), // :latest
      taskDefinition: taskDef,
      environment: {
        STAGE: 'prod',
      },
      logging: logDriver,
      portMappings: [
        { containerPort: 8443, name: 'elixir-https' },
        { containerPort: 25, name: 'elixir-smtp' }
      ]
    });

    //const rdsSecretName = `prod/${id}/mysql/credentials`;
    const rdsSecretName = `prod/${id}/aurora/credentials`;
    EnvironmentUtils.addEnvironments(this, id, props, containerDef, rdsSecretName, rdsInstance);

    const sg = new ec2.SecurityGroup(this, `${id}System`, {
      vpc,
      allowAllOutbound: false,
      description: `${id} ALB`,
      securityGroupName: `${id}ALB`
    });
    sg.addIngressRule(ec2.Peer.ipv4(vpc.vpcCidrBlock), ec2.Port.tcp(3306), 'Inbound MYSQL');
    sg.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(443), 'Inbound HTTPS');
    sg.addEgressRule(ec2.Peer.anyIpv4(), ec2.Port.allTcp(), 'Outbound');

    const domainZone = HostedZone.fromLookup(this, 'Zone', {
      domainName
    });

    const certificate = new Certificate(this, `${id}Certificate`, {
      domainName: `*.${domainName}`,
      //domainName: `${id}.${domainName}`,
      validation: CertificateValidation.fromDns(domainZone)
    });

    // Create a load-balanced Fargate service and make it public
    const albFargateService = new ApplicationLoadBalancedFargateService(this, `${id}FargateService`, {
      cluster,
      taskDefinition: taskDef,
      taskSubnets: vpcSubnets,
      desiredCount: 1,
      publicLoadBalancer: true,
      assignPublicIp: true,
      domainName: `${id}.${domainName}`,
      domainZone,
      certificate,
      protocol: ApplicationProtocol.HTTPS,
      targetProtocol: ApplicationProtocol.HTTPS,
      securityGroups: [sg],
      minHealthyPercent: 50,
      idleTimeout: Duration.seconds(600),
      healthCheckGracePeriod: Duration.seconds(240)
    });

    const targetGroup = albFargateService.targetGroup;
    targetGroup.setAttribute('deregistration_delay.timeout_seconds', '30');
    targetGroup.configureHealthCheck({
      healthyHttpCodes: '200,302',
      path: '/elixir/',
      protocol: Protocol.HTTPS,
      port: '8443',
      healthyThresholdCount: 3,
      interval: Duration.seconds(30)
    });
  }

}
