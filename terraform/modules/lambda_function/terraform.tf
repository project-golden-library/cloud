terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

variable "function_name" {
  type     = string
  nullable = false
}

variable "handler" {
  type     = string
  nullable = false
}

variable "role_arn" {
  type     = string
  nullable = false
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

variable "memory_size" {
  type    = number
  default = 128
}

variable "timeout" {
  type    = number
  default = 150
}

variable "reserved_concurrent_executions" {
  type     = number
  nullable = true
  default  = null
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "layers" {
  type    = list(string)
  default = []
}
