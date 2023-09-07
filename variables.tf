variable "name" {
  description = "Name to be used on all the resources"
  default     = "web-whispers"
}

variable "region" {
  description = "The AWS region to be used"
  default     = "ap-south-1"
}

variable "env" {
  description = "The environment where infra is deployed"
  default     = "prod"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}