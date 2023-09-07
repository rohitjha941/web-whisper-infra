module "api" {
  source = "terraform-aws-modules/lambda/aws"

  function_name  = "${var.name}-${var.env}-api"
  description    = "API for ${var.name}-${var.env}"
  create_package = false

  image_uri    = "132367819851.dkr.ecr.eu-west-1.amazonaws.com/complete-cow:1.0"
  package_type = "Image"

  timeout                           = 60
  memory_size                       = 1024
  create_lambda_function_url        = true
  cloudwatch_logs_retention_in_days = 7

  vpc_subnet_ids         = module.vpc.private_subnets
  vpc_security_group_ids = [module.all_security_group.security_group_id]
  attach_network_policy  = true
}
