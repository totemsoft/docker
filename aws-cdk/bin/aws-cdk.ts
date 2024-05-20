#!/usr/bin/env node
import { App } from 'aws-cdk-lib';
import { AwsCdkStack } from '../lib/aws-cdk-stack';

const stackId = 'totemsoft';

const app = new App();

new AwsCdkStack(app, stackId, {
  env: {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION
  },
  description: `${stackId} Elixir Stack`,
  tags: {'Name': `${stackId} Elixir`},
  terminationProtection: false
});

//app.synth();
