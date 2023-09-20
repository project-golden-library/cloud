terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "artifact_bucket" {
  type = string
}

variable "artifact_key" {
  type = string
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
  type    = optional(number)
  default = null
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "layers" {
  type    = list(string)
  default = null
}
