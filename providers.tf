provider "aws" {
  region = var.region

  default_tags {
    Terraform   = "true"
    Environment = var.env
    Project     = var.name
  }
}

provider "awscc" {
  region = var.region

  default_tags {
    Terraform   = "true"
    Environment = var.env
    Project     = var.name
  }
}

terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.2.0"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "0.57.0"
    }
  }
}
