import { CfnParameter, Duration, Stack, StackProps } from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { AwsLogDriver, Cluster, ContainerDefinition, ContainerImage, FargateTaskDefinition } from 'aws-cdk-lib/aws-ecs';
import { ApplicationLoadBalancedFargateService } from 'aws-cdk-lib/aws-ecs-patterns';
import { ApplicationProtocol, Protocol } from 'aws-cdk-lib/aws-elasticloadbalancingv2';
import { HostedZone } from 'aws-cdk-lib/aws-route53';
import { EnvironmentUtils } from './include/environment-utils';
import { MysqlInstance } from './include/mysql';
import { PolicyStatement } from 'aws-cdk-lib/aws-iam';
//import { Bucket } from 'aws-cdk-lib/aws-s3';
import * as ec2 from 'aws-cdk-lib/aws-ec2';

export interface AwsCdkStackProps extends StackProps {

  /**
   * The zone domain e.g. example.com
   * @type {string}
   * @memberof AwsCdkStackProps
   */
  readonly domainName: string;

  /**
   * The target version up to which Flyway should consider migrations.
   * @type {string}
   * @memberof AwsCdkStackProps
   */
  readonly flywayTarget?: string;

  /**
   * The version to tag an existing schema with when executing baseline.
   * @type {string}
   * @memberof AwsCdkStackProps
   */
  readonly flywayBaselineVersion?: string;

}

export class AwsCdkStack extends Stack {
  constructor(scope: Construct, id: string, props: AwsCdkStackProps) {
    super(scope, id, props);
/*
    // cdk deploy xcelerate --parameters domainName=elixirlegal.com
    const domainNameParameter = new CfnParameter(this, 'domainName', {
      type: 'String',
      description: 'The zone domain e.g. example.com'
    });
    const domainName = domainNameParameter.valueAsString;
*/
    const domainName = props.domainName;

    const vpc = new ec2.Vpc(this, `${id}Vpc`, {
      //maxAzs: 3
    });

    const vpcSubnets: ec2.SubnetSelection = {
      //onePerAz: true,
      //availabilityZones: ['ap-southeast-2a', 'ap-southeast-2b', 'ap-southeast-2c'],
      subnetType: ec2.SubnetType.PUBLIC
    };

    const mysqlInstance = new MysqlInstance(this, id, {
      env: { region: this.region },
      description: `${id} Mysql`,
      vpc: vpc,
      vpcSubnets: vpcSubnets,
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.SMALL),
      deletionProtection: props.terminationProtection,
      //dbName: `${id}db`,
      //dbUsername: ${id}
    });

    const cluster = new Cluster(this, `${id}Cluster`, {
      vpc
    });

    const taskDef = new FargateTaskDefinition(this, `${id}TaskDefinition`, {
      cpu: 1024,
      memoryLimitMiB: 2048
    });
    taskDef.addToTaskRolePolicy(new PolicyStatement( {
        actions: [
            'cognito-idp:Admin*',
            's3:*',
            'ses:*',
            'workdocs:*'
        ],
        resources: ['*']
    }))

    // create a task definition with CloudWatch Logs
    const logDriver = new AwsLogDriver({
      streamPrefix: `ecs-${id}`
    });
    const containerDef = new ContainerDefinition(this, `${id}ContainerDefinition`, {
      image: ContainerImage.fromRegistry('totemsoft/wildfly-elixir'),
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
    EnvironmentUtils.addEnvironments(this, id, props, containerDef, mysqlInstance);

    const sg = new ec2.SecurityGroup(this, `${id}System`, {
      vpc,
      allowAllOutbound: true,
      description: `${id} ALB`,
      securityGroupName: `${id}ALB`
    });
    sg.addIngressRule(ec2.Peer.ipv4(vpc.vpcCidrBlock), ec2.Port.tcp(3306), 'Inbound MYSQL');
    sg.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(443), 'Inbound HTTPS');
    sg.addEgressRule(ec2.Peer.anyIpv4(), ec2.Port.allTcp(), 'Outbound');

    const domainZone = HostedZone.fromLookup(this, 'Zone', {
      domainName: domainName
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
      domainZone: domainZone,
      protocol: ApplicationProtocol.HTTPS,
      targetProtocol: ApplicationProtocol.HTTPS,
      securityGroups: [sg],
      idleTimeout: Duration.seconds(600),
      healthCheckGracePeriod: Duration.seconds(120)
    });

    const targetGroup = albFargateService.targetGroup;
    targetGroup.setAttribute('deregistration_delay.timeout_seconds', '30');
    targetGroup.configureHealthCheck({
      healthyHttpCodes: '200,302',
      path: '/elixir/',
      protocol: Protocol.HTTPS,
      port: '8443',
      interval: Duration.seconds(30)
    });
  }
}
