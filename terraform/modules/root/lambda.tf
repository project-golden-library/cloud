module "parse_feed" {
  source = "../lambda_function"

  function_name      = "parse_feed"
  handler            = "handlers/parse_feed.handler"
  role_arn           = aws_iam_role.parse_feed.arn
  artifact_s3_bucket = aws_s3_object.lambda_package.bucket
  artifact_s3_key    = aws_s3_object.lambda_package.key
  source_code_hash   = data.archive_file.lambda_package.output_base64sha256

  environment_variables = {
    DYNAMODB_TABLE_NAME = aws_dynamodb_table.urls.name
  }
  layers = [data.aws_ssm_parameter.feedparser_layer_arn.value]
}