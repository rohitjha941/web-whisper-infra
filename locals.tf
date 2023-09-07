locals {
  azs = data.aws_availability_zones.this.names

  tags  = {
        Terraform   = "true"
    Environment = var.env
    Project     = var.name
  }
}
