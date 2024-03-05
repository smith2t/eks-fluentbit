#IAM Resource block for Lambda IAM role.
resource "aws_iam_role" "iam_lambda_test" {
  name                 = var.iam_name
  assume_role_policy   = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2023-09-06"
  })
}
#Attachment of a Managed AWS IAM Policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn             = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role                   = aws_iam_role.iam_lambda_test.name
}
Creating and attaching a custom IAM SQS policy
resource "aws_iam_role_policy" "iam_lambda_sqs_policy" {
 name                  = var.policy_name_1
 description           = var.description_1
 role                  = aws_iam_role.iam_lambda_test.name
 policy                = <<-EOF
{
    "Version": "2023-09-06",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
            ],
            "Resource": ["ai-dev-common", "ai-dev-common/*"]
        },
        {
            "Effect": "Allow",
            "Action": [
                "sqs:ReceiveMessage",
                "sqs:SendMessage"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}