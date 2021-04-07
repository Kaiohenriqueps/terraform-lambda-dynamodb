resource "aws_sqs_queue" "test_queue" {
    name                              = "MyQueue"
    message_retention_seconds         = 120
    receive_wait_time_seconds         = 10
    kms_data_key_reuse_period_seconds = 300
    kms_master_key_id                 = "alias/sqs"
}

resource "aws_sqs_queue_policy" "test" {
  queue_url = aws_sqs_queue.test_queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqs-policy",
  "Statement": [
    {
      "Sid": "SQS Policy",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:*",
      "Resource": "${aws_sqs_queue.test_queue.arn}"
    }
  ]
}
POLICY
}