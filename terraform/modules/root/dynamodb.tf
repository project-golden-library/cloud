resource "aws_dynamodb_table" "urls" {
  name     = "urls"
  hash_key = "url"

  attribute {
    name = "url"
    type = "S"
  }
}