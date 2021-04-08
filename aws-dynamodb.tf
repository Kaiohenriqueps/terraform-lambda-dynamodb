resource "aws_dynamodb_table" "teste" {
  name           = "tabela_teste_terraform"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "user_id"
  range_key      = "item_id"

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.dynamodb.arn
  }

  attribute {
    name = "user_id"
    type = "N"
  }

  attribute {
    name = "item_id"
    type = "N"
  }
}
