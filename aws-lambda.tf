data "archive_file" "lambda" {
    type        = "zip"
    source_file = "${path.module}/lambda/insert_into_dynamodb.py"
    output_path = "${path.module}/lambda/insert_into_dynamodb_function.zip"
}

resource "aws_lambda_function" "insert_into_dynamodb" {
    filename      		= "${path.module}/lambda/insert_into_dynamodb_function.zip"
    function_name 		= "insert_into_dynamodb"
    role          		= aws_iam_role.lambda.arn
    handler 			= "insert_into_dynamodb.insert_into_dynamodb"
    source_code_hash 	= data.archive_file.lambda.output_base64sha256

    runtime 	= "python3.6"
    memory_size = 512
    kms_key_arn = aws_kms_key.lambda.arn
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
	event_source_arn    = aws_sqs_queue.test_queue.arn
	function_name       = aws_lambda_function.insert_into_dynamodb.arn
	enabled             = true
}