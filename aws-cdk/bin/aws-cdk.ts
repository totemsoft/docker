#!/usr/bin/env node
import { App } from 'aws-cdk-lib';
import { AwsCdkStack } from '../lib/aws-cdk-stack';

// cdk deploy stack-logical-id --parameters stack-name:parameter-name=parameter-value
var stackId = process.env.STACK_ID;
if (stackId === undefined) {
  stackId = 'stack-logical-id';
}

// TODO: provide as input parameters
// DEFAULTS
var domainName = 'company.com';
var terminationProtection = undefined;
var flywayTarget = undefined;
var flywayCherryPick = undefined;
if (stackId === 'xcelerate') {
  // XCELERATE MIGRATION
  domainName = 'elixirlegal.com';
  //terminationProtection = true;
  //flywayTarget = '5.0.2';
  //flywayCherryPick = '5.0.2';
}
// TODO: provide as input parameters

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
  terminationProtection: terminationProtection,
  // AwsCdkStackProps
  domainName: domainName,
  flywayTarget: flywayTarget,
  flywayCherryPick: flywayCherryPick,
});
