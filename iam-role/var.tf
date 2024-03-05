variable iam_name {
  type = string
  default = "test-lambda-role"
}

variable policy_name_1 {
  type = string
  default = "test-lambda-sqs-policy"
}

variable policy_name_2 {
  type = string
  default = "test-lambda-s3-policy"
}

variable description_1 {
  type = string
  default = "Policy for lambda function to send and receive SQS messages"
}

variable description_2 {
  type = string
  default = "Policy for lambda function to access S3"
}
