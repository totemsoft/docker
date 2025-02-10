# Working with the AWS CDK in TypeScript

Install TypeScript
* `npm install -g typescript`
* `npm install -g aws-cdk`
* `brew upgrade node`

Create a project:
* `mkdir aws-cdk`
* `cd aws-cdk`
* `cdk init app --language typescript`
* `alias cdk="npx aws-cdk"`

* `vi ~/.aws/config`
[default]
region = ap-southeast-2
output = json

[profile totemsoft-sso]
sso_start_url = https://d-976744ecf2.awsapps.com/start
sso_region = ap-southeast-2
sso_account_id = <aws-account-id>
sso_role_name = PowerUserAccess

* `export AWS_PROFILE=totemsoft-sso`

PowerUserAccess Inline policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "iam:*"
            ],
            "Resource": [
                "arn:aws:iam::<aws-account-id>:role/**"
            ]
        }
    ]
}

* `vi ~/.aws/credentials`

* `export AWS_PROFILE=totemsoft-sso`

* `aws sso login`
* `aws sts get-caller-identity`

Configuring environments:
* `export CDK_DEFAULT_ACCOUNT=<aws-account-id>`
* `export CDK_DEFAULT_REGION=ap-southeast-2`
* `npm install @types/node`

Create stack:
* `cdk bootstrap`
* `cdk synth`

Deploy stack:
* `export STACK_ID=xcelerate`
* `export SNAPSHOT_IDENTIFIER=arn:aws:rds:${CDK_DEFAULT_REGION}:${CDK_DEFAULT_ACCOUNT}:snapshot:rds:<snapshot-name>`
* `cdk deploy`

Destroy stack:
* `cdk destroy`
* `aws sso logout`

# Welcome to your CDK TypeScript project

This is a blank project for CDK development with TypeScript.

The `cdk.json` file tells the CDK Toolkit how to execute your app.

## Useful commands

* `npm run build`   compile typescript to js
* `npm run watch`   watch for changes and compile
* `npm run test`    perform the jest unit tests
* `npx cdk deploy`  deploy this stack to your default AWS account/region
* `npx cdk diff`    compare deployed stack with current state
* `npx cdk synth`   emits the synthesized CloudFormation template

# References
* [Working with the AWS CDK in TypeScript](https://docs.aws.amazon.com/cdk/v2/guide/work-with-cdk-typescript.html)
* [Creating an AWS Fargate service using the AWS CDK](https://docs.aws.amazon.com/cdk/v2/guide/ecs_example.html)
* [Configuring environments](https://docs.aws.amazon.com/cdk/v2/guide/environments.html)
* [ASW CDK Examples](https://github.com/aws-samples/aws-cdk-examples/tree/main/typescript)
