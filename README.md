# AWS lambda example

This project is an example of using AWS serverless infrastructure to create a three tier application. It uses DynamoDB as it’s backend store, lambda as the mechanism of pulling data from a 3rd party API and then exposed via an API gateway.

There is also an S3 bucket hosting a static webpage that consumes the lambda api, and that can be found  here: [https://richards-lambda-test-qa.s3.eu-west-2.amazonaws.com](https://richards-lambda-test-qa.s3.eu-west-2.amazonaws.com)

## Setup

To run this locally you will need Ruby 2.5.x and Terraform 0.11.x. I use [asdf](https://github.com/asdf-vm/asdf) version manager for this. But you can use any version or package manager you prefer.

 You will also need to install the [AWS SAM cli](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)


## Deployment

Run `terraform apply -var-file="$HOME/.aws.tfvars"` to create the S3 buckets and DynamoDB table.

Then follow the deploy guide in the [Useful resources](# Useful resources)

## TODO

 * Remove remaining references to initial project idea (park-run)
 * Work out how to inject secrets into the lambda
 * Have diffent CORS policy for local and production enviorment
 * Add DNS via Route 53
 * Add Cloudfront distribution for the static site
 * Redo and TDD the Ruby lambda

## Useful resources

 * [AWS Tutorial: Deploying a Hello World Application](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-hello-world.html)
 * [Scheduling Lambda Functions](https://hector.dev/2018/06/14/scheduling-lambda-functions-with-aws-sam.html)
