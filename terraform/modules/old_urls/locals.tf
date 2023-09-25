locals {
  sqs = {
    visibility_timeout = 30
  }
  lambda = {
    enabled = false
  }
}