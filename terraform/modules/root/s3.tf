data "archive_file" "lambda_package" {
  output_path = "lambda_package"
  type        = "zip"
  source_dir  = "${path.module}/../../../src"
}

resource "aws_s3_object" "lambda_package" {
  bucket = var.artifact_bucket
  key    = "cloud/lambda_package.zip"
  source = data.archive_file.lambda_package.output_path
  etag   = filemd5(data.archive_file.lambda_package.output_path)
}