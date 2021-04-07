resource "aws_iam_policy" "dynamodb_with_kms" {
  name = "dynamodb-with-kms-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = setunion(var.dynamodb_policies, var.kms_policies)
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "insert_into_dynamodb" {
  name   = "insert-into-dynamodb-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = setunion(var.dynamodb_policies, var.kms_policies, var.sqs_policies, var.cloudwatch_policies, var.ec2_policies)
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
