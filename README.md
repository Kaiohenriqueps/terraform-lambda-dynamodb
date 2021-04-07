# terraform-lambda-dynamodb
Creating a terraform script that creates a lambda function, sqs queue, dynamodb table and KMS key. Lambda function inserts record into dynamodb (with KMS encryption).

## Pre requisites
1. Terraform installed
2. AWS Credentials configured

## Planning resources
```
$ terraform plan
```

## Applying resources
```
$ terraform init
```