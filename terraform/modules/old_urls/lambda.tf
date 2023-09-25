module "get_old_urls_01" {
  source = "../lambda_function"

  function_name = "get_old_urls_01"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_02.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_01" {
  function_name    = module.get_old_urls_01.function_arn
  event_source_arn = aws_sqs_queue.queue_01.arn
  batch_size       = 1
}

module "get_old_urls_02" {
  source = "../lambda_function"

  function_name = "get_old_urls_02"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_03.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_02" {
  function_name    = module.get_old_urls_02.function_arn
  event_source_arn = aws_sqs_queue.queue_02.arn
  batch_size       = 1
}

module "get_old_urls_03" {
  source = "../lambda_function"

  function_name = "get_old_urls_03"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_04.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_03" {
  function_name    = module.get_old_urls_03.function_arn
  event_source_arn = aws_sqs_queue.queue_03.arn
  batch_size       = 1
}

module "get_old_urls_04" {
  source = "../lambda_function"

  function_name = "get_old_urls_04"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_05.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_04" {
  function_name    = module.get_old_urls_04.function_arn
  event_source_arn = aws_sqs_queue.queue_04.arn
  batch_size       = 1
}

module "get_old_urls_05" {
  source = "../lambda_function"

  function_name = "get_old_urls_05"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_06.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_05" {
  function_name    = module.get_old_urls_05.function_arn
  event_source_arn = aws_sqs_queue.queue_05.arn
  batch_size       = 1
}

module "get_old_urls_06" {
  source = "../lambda_function"

  function_name = "get_old_urls_06"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_07.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_06" {
  function_name    = module.get_old_urls_06.function_arn
  event_source_arn = aws_sqs_queue.queue_06.arn
  batch_size       = 1
}

module "get_old_urls_07" {
  source = "../lambda_function"

  function_name = "get_old_urls_07"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_08.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_07" {
  function_name    = module.get_old_urls_07.function_arn
  event_source_arn = aws_sqs_queue.queue_07.arn
  batch_size       = 1
}

module "get_old_urls_08" {
  source = "../lambda_function"

  function_name = "get_old_urls_08"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_09.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_08" {
  function_name    = module.get_old_urls_08.function_arn
  event_source_arn = aws_sqs_queue.queue_08.arn
  batch_size       = 1
}

module "get_old_urls_09" {
  source = "../lambda_function"

  function_name = "get_old_urls_09"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_10.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_09" {
  function_name    = module.get_old_urls_09.function_arn
  event_source_arn = aws_sqs_queue.queue_09.arn
  batch_size       = 1
}

module "get_old_urls_10" {
  source = "../lambda_function"

  function_name = "get_old_urls_10"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_01.url
    TABLE_NAME = var.table_name
  }

  handler                        = "handlers/get_old_url.handler"
  role_arn                       = aws_iam_role.role.arn
  artifact_s3_bucket             = var.artifact_s3_bucket
  artifact_s3_key                = var.artifact_s3_key
  source_code_hash               = var.source_code_hash
  reserved_concurrent_executions = 1
  timeout                        = local.sqs.visibility_timeout
  layers                         = [data.aws_ssm_parameter.scraping_layer_arn.value]
}

resource "aws_lambda_event_source_mapping" "get_old_urls_10" {
  function_name    = module.get_old_urls_10.function_arn
  event_source_arn = aws_sqs_queue.queue_10.arn
  batch_size       = 1
}
