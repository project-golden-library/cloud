resource "aws_lambda_function" "function" {
  function_name = var.function_name
  handler       = var.handler
  role          = var.role_arn
  runtime       = "python3.11"

  s3_bucket = var.artifact_bucket
  s3_key    = var.artifact_key

  memory_size                    = var.memory_size
  timeout                        = var.timeout
  reserved_concurrent_executions = var.reserved_concurrent_executions

  environment {
    variables = var.environment_variables
  }
}