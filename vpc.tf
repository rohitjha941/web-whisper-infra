module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "~> 5.0"
  name                 = "${var.name}-${var.env}"
  cidr                 = var.cidr
  azs                  = data.aws_availability_zones.this.names
  private_subnets      = [for i, j in local.azs : cidrsubnet(local.cidr, 5, i)]
  public_subnets       = [for i, j in local.azs : cidrsubnet(local.cidr, 5, i + length(local.azs))]
  database_subnets     = [for i, j in local.azs : cidrsubnet(local.cidr, 5, i + 2 * length(local.azs))]
  enable_dns_hostnames = true
}
