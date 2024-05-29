#!/usr/bin/env node
import { App } from 'aws-cdk-lib';
import { AwsCdkStack } from '../lib/aws-cdk-stack';

// TODO: provide as input parameters
// DEFAULTS
var stackId = 'company';
var domainName = 'company.com';
var terminationProtection = undefined;
var flywayTarget = undefined;
//* 
// XCELERATE MIGRATION
stackId = 'xcelerate';
domainName = 'elixirlegal.com';
//terminationProtection = true;
flywayTarget = '5.0.1';
//*/
// TODO: provide as input parameters

const app = new App();

new AwsCdkStack(app, stackId, {
  // StackProps
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION
  },
  description: `${stackId} Elixir Stack`,
  tags: {'Name': `${stackId} Elixir`},
  terminationProtection: terminationProtection,
  // AwsCdkStackProps
  domainName: domainName,
  flywayTarget: flywayTarget,
});

//app.synth();
