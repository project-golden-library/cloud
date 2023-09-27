module "function" {
  source = "../lambda_function"

  function_name = var.function_name
  environment_variables = {
    QUEUE_URL  = var.next_queue_url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = var.timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "function" {
  function_name    = module.function.function_arn
  event_source_arn = var.current_queue_arn
  batch_size       = 1
  enabled          = var.enabled
}
