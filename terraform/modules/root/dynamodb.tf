resource "aws_dynamodb_table" "urls" {
  name         = "urls"
  hash_key     = "url"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "url"
    type = "S"
  }

  tags = var.test_tag
}