module "db" {
  source                         = "terraform-aws-modules/rds/aws"
  identifier                     = "${var.name}-${var.env}"
  instance_use_identifier_prefix = true
  create_db_option_group         = false
  create_db_parameter_group      = false

  engine                      = "postgres"
  engine_version              = "14"
  family                      = "postgres14"
  major_engine_version        = "14"
  instance_class              = "db.t4g.micro"
  allocated_storage           = 20
  db_name                     = replace(var.name, "-", "_")
  username                    = replace(var.name, "-", "_")
  port                        = 5432
  multi_az                    = false
  publicly_accessible         = true
  create_db_subnet_group      = true
  manage_master_user_password = true
  subnet_ids                  = module.vpc.public_subnets
  vpc_security_group_ids      = [module.all_security_group.security_group_id]
}
