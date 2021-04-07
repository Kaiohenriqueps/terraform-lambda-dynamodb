variable kms_policies {
  type = list(string)
  default = [
    "kms:*"
  ]
}

variable dynamodb_policies {
  type = list(string)
  default = [
    "dynamodb:*"
  ]
}

variable ec2_policies {
  type = list(string)
  default = [
    "ec2:*"
  ]
}

variable cloudwatch_policies {
  type = list(string)
  default = [
    "logs:*"
  ]
}

variable sqs_policies {
  type = list(string)
  default = [
    "sqs:*"
  ]
}
