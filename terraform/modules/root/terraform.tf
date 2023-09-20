terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

variable "artifact_bucket" {}

variable "test_tag" {
  type = optional(map(string))
  default = null
}