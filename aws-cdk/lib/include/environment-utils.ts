import { SecretValue, Stack } from 'aws-cdk-lib';
import { ContainerDefinition } from 'aws-cdk-lib/aws-ecs';
import { MysqlInstance } from './mysql';
import * as ecs from 'aws-cdk-lib/aws-ecs';
import * as sm from 'aws-cdk-lib/aws-secretsmanager';
import { AwsCdkStackProps } from '../aws-cdk-stack';

export class EnvironmentUtils {
  static addEnvironments(stack: Stack, id: string, props: AwsCdkStackProps, containerDef: ContainerDefinition, mysqlInstance: MysqlInstance): void {
    const smPartialArn = `arn:aws:secretsmanager:${stack.region}:${stack.account}:secret`;

    containerDef.addEnvironment('PROFILE', id);
    containerDef.addEnvironment('TZ', 'Australia/Brisbane');
    containerDef.addEnvironment('JAVA_OPTS', '-Xms1024m -Xmx1536m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true');

    // RDS/MYSQL
    const rdsSecretName = `prod/${id}/mysql/credentials`;
    const rdsSecret = sm.Secret.fromSecretAttributes(stack, rdsSecretName, {
      secretPartialArn: `${smPartialArn}:${rdsSecretName}`
    });
    const host = mysqlInstance.dbEndpoint;
    containerDef.addEnvironment('DB_HOST', host);
    const port = '' + mysqlInstance.dbPort;
    containerDef.addEnvironment('DB_PORT', port);
    const dbName = mysqlInstance.dbName;
    containerDef.addEnvironment('DB_NAME', dbName);
    const username = mysqlInstance.dbCredentials.username;
    containerDef.addEnvironment('DB_USER', username);
    containerDef.addSecret('DB_PASS', ecs.Secret.fromSecretsManager(rdsSecret, 'password'));
    // Flyway migration
    containerDef.addEnvironment('FLYWAY_URL', `jdbc:mysql://${host}:${port}/${dbName}`);
    containerDef.addEnvironment('FLYWAY_USER', username);
    containerDef.addSecret('FLYWAY_PASSWORD', ecs.Secret.fromSecretsManager(rdsSecret, 'password'));
    if (typeof props.flywayTarget !== 'undefined') {
      containerDef.addEnvironment('FLYWAY_TARGET', props.flywayTarget);
    }

    // SMS
    const smsSecretName = 'prod/elixir/sms';
    const smsSecret = sm.Secret.fromSecretAttributes(stack, smsSecretName, {
      secretPartialArn: `${smPartialArn}:${smsSecretName}`
    });
    containerDef.addEnvironment('CLICKATELL_API_ID', EnvironmentUtils._getValueFromSecret(smsSecret, 'apiId'));
    containerDef.addEnvironment('CLICKATELL_CLIENT_ID', EnvironmentUtils._getValueFromSecret(smsSecret, 'clientId'));
    containerDef.addEnvironment('CLICKATELL_USERNAME', EnvironmentUtils._getValueFromSecret(smsSecret, 'username'));
    containerDef.addEnvironment('CLICKATELL_SENDER', EnvironmentUtils._getValueFromSecret(smsSecret, 'sender'));
    containerDef.addSecret('CLICKATELL_PASSWORD', ecs.Secret.fromSecretsManager(smsSecret, 'password'));

    // SMTP/EMAIL
    const smtpSecretName = 'prod/elixir/smtp';
    const smtpSecret = sm.Secret.fromSecretAttributes(stack, smtpSecretName, {
      secretPartialArn: `${smPartialArn}:${smtpSecretName}`
    });
    containerDef.addEnvironment('SMTP_FROM', EnvironmentUtils._getValueFromSecret(smtpSecret, 'from'));
    containerDef.addEnvironment('SMTP_HOST', EnvironmentUtils._getValueFromSecret(smtpSecret, 'host'));
    containerDef.addEnvironment('SMTP_PORT', EnvironmentUtils._getValueFromSecret(smtpSecret, 'port'));
    containerDef.addEnvironment('SMTP_USERNAME', EnvironmentUtils._getValueFromSecret(smtpSecret, 'username'));
    containerDef.addSecret('SMTP_PASSWORD', ecs.Secret.fromSecretsManager(smtpSecret, 'password'));
  }
  private static _getValueFromSecret(secret: sm.ISecret, key: string): string {
    return EnvironmentUtils._getValue(secret.secretValueFromJson(key));
  }
  private static _getValue(secretValue: SecretValue): string {
    return secretValue.unsafeUnwrap();
  }
}
