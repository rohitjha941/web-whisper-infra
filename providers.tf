provider "aws" {
  region = var.region
  default_tags {
    tags = local.tags
  }
}

provider "awscc" {
  region = var.region
  default_tags {
    tags = local.tags
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
