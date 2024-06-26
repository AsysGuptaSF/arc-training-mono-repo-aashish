module "rds_instance" {
  source = "../../../modules/rds"

  db_password_parameter_name   = var.db_password_parameter_name
  use_existing_subnet_group    = var.use_existing_subnet_group
  db_subnet_group_name         = var.db_subnet_group_name
  subnet_ids                   = data.aws_subnets.arc_rds_pvt_subnets.ids
  use_existing_parameter_group = var.use_existing_parameter_group
  db_parameter_group_name      = var.db_parameter_group_name
  db_parameter_group_family    = var.db_parameter_group_family
  db_engine                    = var.db_engine
  db_engine_version            = var.db_engine_version
  db_name                      = var.db_name
  db_identifier                = var.db_identifier
  db_instance_class            = var.db_instance_class
  db_allocated_storage         = var.db_allocated_storage
  db_storage_type              = var.db_storage_type
  storage_encrypted            = var.storage_encrypted
  db_max_allocated_storage     = var.db_max_allocated_storage
  db_publicly_accessible       = var.db_publicly_accessible
  db_username                  = var.db_username
  skip_final_snapshot          = var.skip_final_snapshot
  security_group_name          = var.security_group_name
  security_group_description   = var.security_group_description
  vpc_id                       = data.aws_vpc.arc_poc_vpc.id
  ingress_rules                = var.ingress_rules
  egress_rules                 = var.egress_rules
}
