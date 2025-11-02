import {
  CfnOutput,
  Stack,
  StackProps,
  Tags,
  Duration,
  RemovalPolicy,
} from 'aws-cdk-lib';
import { RdsProps } from './rds-props';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as rds from 'aws-cdk-lib/aws-rds';
import * as secretsmanager from 'aws-cdk-lib/aws-secretsmanager';
import { execSync } from 'child_process';

export class MysqlInstance {

  /**
   * provide the endpoint of the database
   * @type {string}
   * @memberof MysqlInstance
   */
  readonly dbEndpoint: string;

  /**
   * provide the port of the database
   * @type {number}
   * @memberof MysqlInstance
   * @default 3306
   */
  readonly dbPort: number = 3306;

  /**
   * provide the name of the database
   * @type {string}
   * @memberof MysqlInstance
   */
  readonly dbName: string;

  /**
   * provide the username of the database
   * @type {string}
   * @memberof MysqlInstance
   */
  readonly dbUsername: string;

  constructor(stack: Stack, id: string, props: RdsProps) {
    var ingressSources = [];
    if (typeof props.ingressSources !== 'undefined') {
      ingressSources = props.ingressSources;
    }

    var engineVersion = rds.MysqlEngineVersion.VER_8_0;
    //var engineVersion = rds.MysqlEngineVersion.VER_8_0_42;
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

    const tcpMysql = ec2.Port.tcp(this.dbPort);

    const dbsg = new ec2.SecurityGroup(stack, `${id}DatabaseSecurityGroup`, {
      vpc,
      allowAllOutbound: false,
      description: `${id} Database`,
      securityGroupName: `${id}Database`
    });

    // TODO: developer test only
    // https://apple.stackexchange.com/questions/20547/how-do-i-find-my-ip-address-from-the-command-line
    const developerIpAddress = execSync('dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com')
      // remove whitespaces
      .toString().trim()
      // remove both single (‘) and double (“) quotes
      .replace(/['"]+/g, '');
    dbsg.addIngressRule(ec2.Peer.ipv4(`${developerIpAddress}/32`), tcpMysql, 'Admin ONLY !!!');
    dbsg.addIngressRule(ec2.Peer.ipv4(`${developerIpAddress}/32`), tcpMysql, 'Developer ONLY !!!');
    // TODO: developer test only

    dbsg.addIngressRule(ec2.Peer.ipv4(vpc.vpcCidrBlock), tcpMysql, 'Inbound MYSQL');

    dbsg.addEgressRule(ec2.Peer.anyIpv4(), ec2.Port.allTcp(), 'Outbound');

    const mysqlConnectionPorts = [
      { port: tcpMysql, description: `${id} tcp Mysql` }
    ];

    for (let ingressSource of ingressSources!) {
      for (let c of mysqlConnectionPorts) {
        dbsg.addIngressRule(ingressSource, c.port, c.description);
      }
    }

    const dbSecret = new secretsmanager.Secret(stack, `${id}Credentials`, {
      secretName: `prod/${id}/mysql/credentials`,
      description: `Mysql ${this.dbName} Database Crendetials`,
      generateSecretString: {
        excludeCharacters: "\"@/\\ '",
        generateStringKey: 'password',
        passwordLength: 30,
        secretStringTemplate: JSON.stringify({username: this.dbUsername}),
      }
    });

    const dbEngine = rds.DatabaseInstanceEngine.mysql({
        version: engineVersion
    });

    const dbParameterGroup = new rds.ParameterGroup(stack, `${id}ParameterGroup`, {
      engine: dbEngine
    });
    dbParameterGroup.addParameter('log_bin_trust_function_creators', '1');

    let dbInstance;
    if (typeof props.snapshotIdentifier !== 'undefined') {
      const dbCredentials = rds.SnapshotCredentials.fromSecret(
        dbSecret
      );

      dbInstance = new rds.DatabaseInstanceFromSnapshot(stack, `${id}Database`, {
        port: this.dbPort,
        instanceIdentifier: `${id}db`,
        //databaseName: this.dbName, // DBName must be null when Restoring for this Engine.
        engine: dbEngine,
        backupRetention: Duration.days(7),
        securityGroups: [dbsg],
        allowMajorVersionUpgrade: false,
        autoMinorVersionUpgrade: true,
        instanceType: props.instanceType,
        vpc,
        vpcSubnets: props.vpcSubnets,
        removalPolicy: RemovalPolicy.SNAPSHOT,
        deletionProtection: props.deletionProtection,
        snapshotIdentifier: props.snapshotIdentifier,
        //storageEncrypted: true,
        credentials: dbCredentials,
        //monitoringInterval: Duration.seconds(60),
        //enablePerformanceInsights: true,
        parameterGroup: dbParameterGroup,
        preferredBackupWindow: props.backupWindow,
        preferredMaintenanceWindow: props.preferredMaintenanceWindow,
        publiclyAccessible: true
      });

      new CfnOutput(stack, `${id}SnapshotIdentifier`, {
        exportName: `${id}SnapshotIdentifier`,
        value: props.snapshotIdentifier
      });
    } else {
      const dbCredentials = rds.Credentials.fromSecret(
        dbSecret,
        this.dbUsername
      );

      dbInstance = new rds.DatabaseInstance(stack, `${id}Database`, {
        port: this.dbPort,
        instanceIdentifier: `${id}db`,
        databaseName: this.dbName,
        engine: dbEngine,
        backupRetention: Duration.days(7),
        securityGroups: [dbsg],
        allowMajorVersionUpgrade: false,
        autoMinorVersionUpgrade: true,
        instanceType: props.instanceType,
        vpc,
        vpcSubnets: props.vpcSubnets,
        removalPolicy: RemovalPolicy.SNAPSHOT,
        deletionProtection: props.deletionProtection,
        storageEncrypted: true,
        credentials: dbCredentials,
        //monitoringInterval: Duration.seconds(60),
        //enablePerformanceInsights: true,
        parameterGroup: dbParameterGroup,
        preferredBackupWindow: props.backupWindow,
        preferredMaintenanceWindow: props.preferredMaintenanceWindow,
        publiclyAccessible: true
      });
    }

    //dbInstance.addRotationSingleUser();

    // Tags
    Tags.of(dbInstance).add('Name', `${id}Database`, {
      priority: 300
    });

    this.dbEndpoint = dbInstance.dbInstanceEndpointAddress;
    new CfnOutput(stack, `${id}Endpoint`, {
      exportName: `${id}Endpoint`,
      value: this.dbEndpoint
    });

    new CfnOutput(stack, `${id}Username`, {
      exportName: `${id}Username`,
      value: this.dbUsername
    });

    new CfnOutput(stack, `${id}DbName`, {
      exportName: `${id}DbName`,
      value: this.dbName
    });
  }
}
