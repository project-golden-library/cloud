resource "aws_lambda_function" "function" {
  function_name = var.function_name
  handler       = var.handler
  role          = var.role_arn
  runtime       = "python3.11"
  publish       = true
  architectures = ["arm64"]

  s3_bucket        = var.artifact_s3_bucket
  s3_key           = var.artifact_s3_key
  source_code_hash = var.source_code_hash

  memory_size                    = var.memory_size
  timeout                        = var.timeout
  reserved_concurrent_executions = var.reserved_concurrent_executions
  layers = concat(
    [
      "arn:aws:lambda:us-east-1:017000801446:layer:AWSLambdaPowertoolsPythonV2-Arm64:43",
      data.aws_ssm_parameter.base_layer_arn.value
    ],
    var.layers
  )

  environment {
    variables = var.environment_variables
  }
}

resource "aws_lambda_alias" "function" {
  function_name    = aws_lambda_function.function.arn
  function_version = aws_lambda_function.function.version
  name             = "process"
}
