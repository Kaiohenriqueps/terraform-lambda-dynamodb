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

variable "cidr_block" {
    type    = string
    default = "192.168.0.0/24"
}

variable "vpc_name" {
    type    = string
    default = "TerraformVPC"
}

variable "ingressrules" {
    type    = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type    = list(number)
    default = [80, 443, 25, 3306, 53, 8080]
}

variable "subnet_ids" {
    type = list(string)
    default = [
        "subnet-b41ebcd2",
        "subnet-fd6700f3",
        "subnet-c134c5f0",
        "subnet-529b3373",
        "subnet-3b542976",
        "subnet-f2db75ad"
    ]
}