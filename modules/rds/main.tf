# Generate a random password with lower case, upper case, numbers, and special characters
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*()-_=+[]{}<>:?"
}

# Store the generated password in SSM Parameter Store
resource "aws_ssm_parameter" "db_password" {
  name  = var.db_password_parameter_name
  type  = "SecureString"
  value = random_password.db_password.result
}

# Conditionally create Subnet Group if var.use_existing_subnet_group is false
resource "aws_db_subnet_group" "rds_subnet_group" {
  count      = var.use_existing_subnet_group ? 0 : 1
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}

# Conditionally create Parameter Group if var.use_existing_subnet_group is false
resource "aws_db_parameter_group" "rds_parameter_group" {
  count       = var.use_existing_parameter_group ? 0 : 1
  name        = var.db_parameter_group_name
  family      = var.db_parameter_group_family
  description = "Custom parameter group for ${var.db_engine}"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "arc_rds" {

  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  db_name                = var.db_name
  identifier             = var.db_identifier
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  storage_encrypted      = var.storage_encrypted
  max_allocated_storage  = var.db_max_allocated_storage
  publicly_accessible    = var.db_publicly_accessible
  username               = var.db_username
  password               = aws_ssm_parameter.db_password.value
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = var.use_existing_subnet_group ? var.db_subnet_group_name : aws_db_subnet_group.rds_subnet_group[0].name
  parameter_group_name   = var.use_existing_parameter_group ? var.db_parameter_group_name : aws_db_parameter_group.rds_parameter_group[0].name
  apply_immediately      = true
  tags = {
    Name = "${var.db_identifier}"
  }
}




