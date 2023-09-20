terraform {
  cloud {
    organization = "project-luciferous-golden-library"

    workspaces {
      name = "cloud"
    }
  }

  required_version = "1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "root" {
  source = "../modules/root"

  artifact_bucket = var.ARTIFACT_BUCKET
  test_tag = {
    data = "sinofseven"
  }
}

variable "ARTIFACT_BUCKET" {}