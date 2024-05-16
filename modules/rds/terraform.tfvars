aws_region                   = "ap-south-1"
db_name                      = "arc_poc_rds"
db_engine                    = "postgres"
db_engine_version            = "16.3"
db_username                  = "postgres"
db_identifier                = "arc-rds-poc-postgres"
vpc_security_group_ids       = ["sg-1addcd76"]
db_instance_class            = "db.m5.large"
db_storage_type              = "gp3"
db_allocated_storage         = 100
storage_encrypted            = true
db_publicly_accessible       = false
skip_final_snapshot          = true
use_existing_subnet_group    = false
subnet_ids                   = ["subnet-f07af6bc", "subnet-991749f1", "subnet-c3c81eb8"]
db_subnet_group_name         = "arc_poc_db_subnet_group"
db_password_parameter_name   = "/arc_rds_poc/db_password"
use_existing_parameter_group = false
db_parameter_group_name      = "arc-poc-rds-custom-pg"
db_parameter_group_family    = "postgres16"