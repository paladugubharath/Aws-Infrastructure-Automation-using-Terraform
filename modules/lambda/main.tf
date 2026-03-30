variable "lambda_role" {}

resource "aws_lambda_function" "lambda" {
  function_name = "devops-lambda"
  role = var.lambda_role
  handler = "index.handler"
  runtime = "python3.9"

  filename = "lambda.zip"
}