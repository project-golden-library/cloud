terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

variable "artifact_s3_bucket" {
  type     = string
  nullable = false
}

variable "artifact_s3_key" {
  type     = string
  nullable = false
}

variable "source_code_hash" {
  type     = string
  nullable = false
}

variable "table_name" {
  type     = string
  nullable = false
}

variable "timeout" {
  type     = number
  nullable = false
}

variable "function_name" {
  type     = string
  nullable = false
}

variable "next_queue_url" {
  type     = string
  nullable = false
}

variable "current_queue_arn" {
  type     = string
  nullable = false
}

variable "enabled" {
  type     = bool
  nullable = false
}
