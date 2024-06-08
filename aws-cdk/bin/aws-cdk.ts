#!/usr/bin/env node
import { App } from 'aws-cdk-lib';
import { AwsCdkStack } from '../lib/aws-cdk-stack';

// cdk deploy stack-logical-id --parameters stack-name:parameter-name=parameter-value
let stackId = process.env.STACK_ID;
if (stackId === undefined) {
  stackId = 'stack-logical-id';
}

// DEFAULTS
let terminationProtection = false;
let domainName = 'company.com';
let flywayMigrateData = true;

// XCELERATE MIGRATION
if (stackId === 'xcelerate') {
  //terminationProtection = true;
  domainName = 'elixirlegal.com';
  flywayMigrateData = false;
}

const app = new App();

new AwsCdkStack(app, stackId, {
  // StackProps
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION
  },
  stackName: stackId,
  description: `${stackId} Elixir Stack`,
  tags: {'Name': `${stackId} Elixir`},
  terminationProtection,
  // AwsCdkStackProps
  domainName,
  flywayMigrateData
});
