resource "random_string" "string" {
  length  = 20
  special = false
}

data "aws_ecr_image" "latest" {
  name = "${var.name}-api"
}

module "api" {
  source = "terraform-aws-modules/lambda/aws"

  function_name  = "${var.name}-${var.env}-api"
  description    = "API for ${var.name}-${var.env}"
  create_package = false

  image_uri    = "${data.aws_ecr_image.latest.repository_url}:${data.aws_ecr_image.latest.image_digest}"
  package_type = "Image"

  timeout                           = 60
  memory_size                       = 1024
  create_lambda_function_url        = true
  cloudwatch_logs_retention_in_days = 7

  vpc_subnet_ids         = module.vpc.private_subnets
  vpc_security_group_ids = [module.all_security_group.security_group_id]
  attach_network_policy  = true

  environment_variables = {
    "POSTGRES_SERVER"      = module.db.db_instance_address
    "POSTGRES_PORT"        = module.db.db_instance_port
    "POSTGRES_USER"        = module.db.db_instance_username
    "POSTGRES_DB"          = module.db.db_instance_name
    "PROJECT_NAME"         = "${var.name}-api"
    "BACKEND_CORS_ORIGINS" = "[\"*\"]"
    "SECERET_KEY"          = random_string.string.result
    "ALGORITHM"            = "HS256"
  }
}
