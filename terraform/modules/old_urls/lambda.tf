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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
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
  enabled          = local.lambda.enabled
}

module "get_old_urls_10" {
  source = "../lambda_function"

  function_name = "get_old_urls_10"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_11.url
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
  enabled          = local.lambda.enabled
}

module "get_old_urls_11" {
  source = "../lambda_function"

  function_name = "get_old_urls_11"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_12.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_11" {
  function_name    = module.get_old_urls_11.function_arn
  event_source_arn = aws_sqs_queue.queue_11.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_12" {
  source = "../lambda_function"

  function_name = "get_old_urls_12"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_13.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_12" {
  function_name    = module.get_old_urls_12.function_arn
  event_source_arn = aws_sqs_queue.queue_12.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_13" {
  source = "../lambda_function"

  function_name = "get_old_urls_13"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_14.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_13" {
  function_name    = module.get_old_urls_13.function_arn
  event_source_arn = aws_sqs_queue.queue_13.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_14" {
  source = "../lambda_function"

  function_name = "get_old_urls_14"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_15.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_14" {
  function_name    = module.get_old_urls_14.function_arn
  event_source_arn = aws_sqs_queue.queue_14.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_15" {
  source = "../lambda_function"

  function_name = "get_old_urls_15"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_16.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_15" {
  function_name    = module.get_old_urls_15.function_arn
  event_source_arn = aws_sqs_queue.queue_15.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_16" {
  source = "../lambda_function"

  function_name = "get_old_urls_16"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_17.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_16" {
  function_name    = module.get_old_urls_16.function_arn
  event_source_arn = aws_sqs_queue.queue_16.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_17" {
  source = "../lambda_function"

  function_name = "get_old_urls_17"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_18.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_17" {
  function_name    = module.get_old_urls_17.function_arn
  event_source_arn = aws_sqs_queue.queue_17.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_18" {
  source = "../lambda_function"

  function_name = "get_old_urls_18"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_19.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_18" {
  function_name    = module.get_old_urls_18.function_arn
  event_source_arn = aws_sqs_queue.queue_18.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_19" {
  source = "../lambda_function"

  function_name = "get_old_urls_19"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_20.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_19" {
  function_name    = module.get_old_urls_19.function_arn
  event_source_arn = aws_sqs_queue.queue_19.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_20" {
  source = "../lambda_function"

  function_name = "get_old_urls_20"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_21.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_20" {
  function_name    = module.get_old_urls_20.function_arn
  event_source_arn = aws_sqs_queue.queue_20.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_21" {
  source = "../lambda_function"

  function_name = "get_old_urls_21"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_22.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_21" {
  function_name    = module.get_old_urls_21.function_arn
  event_source_arn = aws_sqs_queue.queue_21.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_22" {
  source = "../lambda_function"

  function_name = "get_old_urls_22"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_23.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_22" {
  function_name    = module.get_old_urls_22.function_arn
  event_source_arn = aws_sqs_queue.queue_22.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_23" {
  source = "../lambda_function"

  function_name = "get_old_urls_23"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_24.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_23" {
  function_name    = module.get_old_urls_23.function_arn
  event_source_arn = aws_sqs_queue.queue_23.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_24" {
  source = "../lambda_function"

  function_name = "get_old_urls_24"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_25.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_24" {
  function_name    = module.get_old_urls_24.function_arn
  event_source_arn = aws_sqs_queue.queue_24.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_25" {
  source = "../lambda_function"

  function_name = "get_old_urls_25"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_26.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_25" {
  function_name    = module.get_old_urls_25.function_arn
  event_source_arn = aws_sqs_queue.queue_25.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_26" {
  source = "../lambda_function"

  function_name = "get_old_urls_26"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_27.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_26" {
  function_name    = module.get_old_urls_26.function_arn
  event_source_arn = aws_sqs_queue.queue_26.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_27" {
  source = "../lambda_function"

  function_name = "get_old_urls_27"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_28.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_27" {
  function_name    = module.get_old_urls_27.function_arn
  event_source_arn = aws_sqs_queue.queue_27.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_28" {
  source = "../lambda_function"

  function_name = "get_old_urls_28"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_29.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_28" {
  function_name    = module.get_old_urls_28.function_arn
  event_source_arn = aws_sqs_queue.queue_28.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_29" {
  source = "../lambda_function"

  function_name = "get_old_urls_29"
  environment_variables = {
    QUEUE_URL  = aws_sqs_queue.queue_30.url
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

resource "aws_lambda_event_source_mapping" "get_old_urls_29" {
  function_name    = module.get_old_urls_29.function_arn
  event_source_arn = aws_sqs_queue.queue_29.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}

module "get_old_urls_30" {
  source = "../lambda_function"

  function_name = "get_old_urls_30"
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

resource "aws_lambda_event_source_mapping" "get_old_urls_30" {
  function_name    = module.get_old_urls_30.function_arn
  event_source_arn = aws_sqs_queue.queue_30.arn
  batch_size       = 1
  enabled          = local.lambda.enabled
}
