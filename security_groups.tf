module "all_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  name   = "${var.name}-${var.env}-all-security-group"
  vpc_id = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

