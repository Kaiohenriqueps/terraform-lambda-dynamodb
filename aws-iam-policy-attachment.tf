resource "aws_iam_role_policy_attachment" "dynamodb_with_kms" {
  policy_arn = aws_iam_policy.dynamodb_with_kms.arn
  role       = aws_iam_role.kms.name
}

resource "aws_iam_role_policy_attachment" "insert_into_dynamodb" {
  policy_arn = aws_iam_policy.insert_into_dynamodb.arn
  role       = aws_iam_role.lambda.name
}
