import {
  StackProps
} from 'aws-cdk-lib';
import * as ec2 from 'aws-cdk-lib/aws-ec2';

export interface RdsProps extends StackProps {

  /**
   * VPC
   * @type {ec2.IVpc}
   * @memberof RdsProps
   */
  readonly vpc: ec2.IVpc;

  /**
   * List of Subnet
   * @type {string[]}
   * @memberof RdsProps
   */
  readonly vpcSubnets: ec2.SubnetSelection;

  /**
   * ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.SMALL)
   * @type {*}
   * @memberof RdsProps
   * @default ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.SMALL)
   */
  readonly instanceType?: any;

  /**
   * provide the version of the database
   * @type {*}
   * @memberof RdsProps
   * @default rds.MysqlEngineVersion.VER_8_0
   */
  readonly engineVersion?: any;

  /**
   * provide the name of the database
   * @type {string}
   * @memberof RdsProps
   * @default elixir
   */
  readonly dbName?: string;

  /**
   * user name of the database
   * @type {string}
   * @memberof RdsProps
   * @default elixir
   */
  readonly dbUsername?: string;

  /**
   * backup retention days for example 14
   * @type {number}
   * @memberof RdsProps
   * @default 14
   */
  readonly backupRetentionDays?: number;

  /**
   * Indicates whether the DB instance should have deletion protection enabled.
   * @type {boolean}
   * @memberof RdsProps
   * @default false
   */
  readonly deletionProtection?: boolean;

  /**
   * backup window time 00:15-01:15
   * @type {string}
   * @memberof RdsProps
   * @default 00:15-01:15
   */
  readonly backupWindow?: string;

  /**
   * maintenance time Sun:23:45-Mon:00:15
   * @type {string}
   * @memberof RdsProps
   * @default Sun:23:45-Mon:00:15
   */
  readonly preferredMaintenanceWindow?: string;

  /**
   * list of ingress sources
   * @type {any []}
   * @memberof RdsProps
   */
  readonly ingressSources?: any[];

  /**
   * The name or Amazon Resource Name (ARN) of the DB snapshot that's used to
   * restore the DB instance. If you're restoring from a shared manual DB
   * snapshot, you must specify the ARN of the snapshot.
   */
  readonly snapshotIdentifier?: string;
}
