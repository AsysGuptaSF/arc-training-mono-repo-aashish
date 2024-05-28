aws_region                   = "us-east-1"
db_name                      = "arc_poc_rds"
db_engine                    = "postgres"
db_engine_version            = "16.3"
db_username                  = "postgres"
db_identifier                = "arc-rds-poc-postgres"
db_instance_class            = "db.m5.large"
db_storage_type              = "gp3"
db_allocated_storage         = 100
db_max_allocated_storage = 300
storage_encrypted            = true
db_publicly_accessible       = false
skip_final_snapshot          = true
use_existing_subnet_group    = false
# subnet_ids                   = ["subnet-f07af6bc", "subnet-991749f1", "subnet-c3c81eb8"]
db_subnet_group_name         = "arc_poc_db_subnet_group"
db_password_parameter_name   = "/arc_rds_poc/db_password"
use_existing_parameter_group = false
db_parameter_group_name      = "arc-poc-rds-custom-pg"
db_parameter_group_family    = "postgres16"
security_group_name          = "arc-poc-rds-sg"
security_group_description   = "Postgres RDS security group"
# vpc_id                       = "vpc-d74170bf"

ingress_rules = {
  PostgresPort = {
    description = "RDS allowed for all"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

egress_rules = {
  all_traffic = {
    description = "All outbound traffic allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
