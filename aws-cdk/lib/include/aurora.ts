import {
  CfnOutput,
  Stack,
  StackProps,
  Tags,
  Duration,
  RemovalPolicy
} from 'aws-cdk-lib';
import { RdsProps } from './rds-props';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as rds from 'aws-cdk-lib/aws-rds';
import * as secretsmanager from 'aws-cdk-lib/aws-secretsmanager';
import { execSync } from 'child_process';

export class AuroraMysqlInstance {

  /**
   * provide the endpoint of the database
   * @type {string}
   * @memberof AuroraMysqlInstance
   */
  readonly dbEndpoint: string;

  /**
   * provide the port of the database
   * @type {number}
   * @memberof AuroraMysqlInstance
   * @default 3306
   */
  readonly dbPort: number = 3306;

  /**
   * provide the name of the database
   * @type {string}
   * @memberof AuroraMysqlInstance
   */
  readonly dbName: string;

  /**
   * provide the username of the database
   * @type {string}
   * @memberof AuroraMysqlInstance
   */
  readonly dbUsername: string;

  constructor(stack: Stack, id: string, props: RdsProps) {
    var ingressSources = [];
    if (typeof props.ingressSources !== 'undefined') {
      ingressSources = props.ingressSources;
    }

    // Aurora MySQL 3.10.0 (compatible with MySQL 8.0.42)
    var engineVersion = rds.AuroraMysqlEngineVersion.VER_3_10_0;
    if (typeof props.engineVersion !== 'undefined') {
      engineVersion = props.engineVersion;
    }

    this.dbName = 'elixir';
    if (typeof props.dbName !== 'undefined') {
      this.dbName = props.dbName;
    }
    this.dbUsername = 'elixir';
    if (typeof props.dbUsername !== 'undefined') {
      this.dbUsername = props.dbUsername;
    }

    const vpc = props.vpc;

    const tcpAuroraMysql = ec2.Port.tcp(this.dbPort);

    const dbsg = new ec2.SecurityGroup(stack, `${id}AuroraDatabaseSecurityGroup`, {
      vpc,
      allowAllOutbound: false,
      description: `${id} Aurora Mysql Database`,
      securityGroupName: `${id}AuroraDatabase`
    });

    // TODO: developer test only
    // https://apple.stackexchange.com/questions/20547/how-do-i-find-my-ip-address-from-the-command-line
    const developerIpAddress = execSync('dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com')
      // remove whitespaces
      .toString().trim()
      // remove both single (‘) and double (“) quotes
      .replace(/['"]+/g, '');
    dbsg.addIngressRule(ec2.Peer.ipv4(`${developerIpAddress}/32`), tcpAuroraMysql, 'Admin ONLY !!!');
    dbsg.addIngressRule(ec2.Peer.ipv4(`${developerIpAddress}/32`), tcpAuroraMysql, 'Developer ONLY !!!');
    // TODO: developer test only

    dbsg.addIngressRule(ec2.Peer.ipv4(vpc.vpcCidrBlock), tcpAuroraMysql, 'Inbound MYSQL');

    dbsg.addEgressRule(ec2.Peer.anyIpv4(), ec2.Port.allTcp(), 'Outbound');

    const mysqlConnectionPorts = [
      { port: tcpAuroraMysql, description: `${id} Aurora tcp Mysql` }
    ];

    for (let ingressSource of ingressSources!) {
      for (let c of mysqlConnectionPorts) {
        dbsg.addIngressRule(ingressSource, c.port, c.description);
      }
    }

    const dbSecret = new secretsmanager.Secret(stack, `${id}AuroraCredentials`, {
      secretName: `prod/${id}/aurora/credentials`,
      description: `Aurora Mysql ${this.dbName} Database Crendetials`,
      generateSecretString: {
        excludeCharacters: "\"@/\\ '",
        generateStringKey: 'password',
        passwordLength: 30,
        secretStringTemplate: JSON.stringify({username: this.dbUsername}),
      }
    });

    const dbEngine = rds.DatabaseClusterEngine.auroraMysql({
        version: engineVersion
    });

    const dbParameterGroup = new rds.ParameterGroup(stack, `${id}AuroraParameterGroup`, {
      engine: dbEngine,
      
    });
    dbParameterGroup.addParameter('log_bin_trust_function_creators', '1');

    let dbInstance;
    if (typeof props.snapshotIdentifier !== 'undefined') {
      const dbCredentials = rds.SnapshotCredentials.fromSecret(
        dbSecret
      );

      dbInstance = new rds.DatabaseClusterFromSnapshot(stack, `${id}AuroraDatabase`, {
        port: this.dbPort,
        clusterIdentifier: `${id}Auroradb`,
        defaultDatabaseName: this.dbName, // DBName must be null when Restoring for this Engine.
        engine: dbEngine,
        writer: rds.ClusterInstance.provisioned(`${id}Auroradbwriter`, {
          instanceType: props.instanceType,
          publiclyAccessible: false,
        }),
        readers: [
          rds.ClusterInstance.provisioned(`${id}Auroradbreader1`, {
            promotionTier: 1,
            publiclyAccessible: true
          }),
          //rds.ClusterInstance.serverlessV2(`${id}Auroradbreader2`),
        ],
        securityGroups: [dbsg],
        autoMinorVersionUpgrade: true,
        vpc,
        vpcSubnets: props.vpcSubnets,
        removalPolicy: RemovalPolicy.SNAPSHOT,
        deletionProtection: props.deletionProtection,
        snapshotIdentifier: props.snapshotIdentifier,
        //storageEncrypted: true,
        snapshotCredentials: dbCredentials,
        //monitoringInterval: Duration.seconds(60),
        //enablePerformanceInsights: true,
        parameterGroup: dbParameterGroup,
        preferredMaintenanceWindow: props.preferredMaintenanceWindow
      });

      new CfnOutput(stack, `${id}AuroraSnapshotIdentifier`, {
        exportName: `${id}AuroraSnapshotIdentifier`,
        value: props.snapshotIdentifier
      });
    } else {
      const dbCredentials = rds.Credentials.fromSecret(
        dbSecret,
        this.dbUsername
      );

      dbInstance = new rds.DatabaseCluster(stack, `${id}AuroraDatabase`, {
        port: this.dbPort,
        clusterIdentifier: `${id}Auroradb`,
        defaultDatabaseName: this.dbName,
        engine: dbEngine,
        writer: rds.ClusterInstance.provisioned(`${id}Auroradbwriter`, {
          instanceType: props.instanceType,
          publiclyAccessible: false
        }),
        readers: [
          rds.ClusterInstance.provisioned(`${id}Auroradbreader1`, {
            promotionTier: 1,
            publiclyAccessible: true
          }),
          //rds.ClusterInstance.serverlessV2(`${id}Auroradbreader2`),
        ],
        //backupRetention: Duration.days(7),
        securityGroups: [dbsg],
        autoMinorVersionUpgrade: true,
        vpc,
        vpcSubnets: props.vpcSubnets,
        removalPolicy: RemovalPolicy.SNAPSHOT,
        deletionProtection: props.deletionProtection,
        storageEncrypted: true,
        credentials: dbCredentials,
        //monitoringInterval: Duration.seconds(60),
        //enablePerformanceInsights: true,
        parameterGroup: dbParameterGroup,
        preferredMaintenanceWindow: props.preferredMaintenanceWindow
      });
    }

//    dbInstance.addRotationSingleUser({
//        automaticallyAfter: Duration.days(30),
//        excludeCharacters: '!@#$%^&*', // defaults to the set " %+~`#$&*()|[]{}:;<>?!'/@\"\\"
//        securityGroup: dbsg,           // defaults to an auto-created security group
//    });

    // Tags
    Tags.of(dbInstance).add('Name', `${id}AuroraDatabase`, {
      priority: 300
    });

    this.dbEndpoint = dbInstance.clusterEndpoint.socketAddress;
    new CfnOutput(stack, `${id}AuroraEndpoint`, {
      exportName: `${id}AuroraEndpoint`,
      value: this.dbEndpoint
    });

    new CfnOutput(stack, `${id}AuroraUsername`, {
      exportName: `${id}AuroraUsername`,
      value: this.dbUsername
    });

    new CfnOutput(stack, `${id}AuroraDbName`, {
      exportName: `${id}AuroraDbName`,
      value: this.dbName
    });
  }
}
