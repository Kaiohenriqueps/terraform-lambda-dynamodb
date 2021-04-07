resource "aws_kms_key" "dynamodb" {
  description         = "KMS DynamoDB"
  enable_key_rotation = true
}

resource "aws_kms_alias" "dynamodb" {
  name          = "alias/dynamodb"
  target_key_id = aws_kms_key.dynamodb.key_id
}

resource "aws_kms_grant" "dynamodb" {
  name              = "my-grant-dynamodb"
  key_id            = aws_kms_key.dynamodb.key_id
  grantee_principal = aws_iam_role.kms.arn
  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
}

resource "aws_kms_key" "sqs" {
  description         = "KMS SQS"
  enable_key_rotation = true
}

resource "aws_kms_alias" "sqs" {
  name          = "alias/sqs"
  target_key_id = aws_kms_key.sqs.key_id
}

resource "aws_kms_grant" "sqs" {
  name              = "my-grant-sqs"
  key_id            = aws_kms_key.sqs.key_id
  grantee_principal = aws_iam_role.kms.arn
  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
}

resource "aws_kms_key" "lambda" {
  description         = "KMS Lambda"
  enable_key_rotation = true
}

resource "aws_kms_alias" "lambda" {
  name          = "alias/lambda"
  target_key_id = aws_kms_key.lambda.key_id
}

resource "aws_kms_grant" "lambda" {
  name              = "my-grant-lambda"
  key_id            = aws_kms_key.lambda.key_id
  grantee_principal = aws_iam_role.kms.arn
  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
}
