output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.arc_rds.endpoint
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.arc_rds.identifier
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.arc_rds.arn
}

output "db_instance_status" {
  description = "The current status of the RDS instance"
  value       = aws_db_instance.arc_rds.status
}

output "db_password_ssm_parameter" {
  description = "The name of the SSM parameter that stores the database password"
  value       = aws_ssm_parameter.db_password.name
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  value       = var.use_existing_subnet_group ? var.db_subnet_group_name : aws_db_subnet_group.rds_subnet_group[0].name
}

output "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  value       = var.use_existing_parameter_group ? var.db_parameter_group_name : aws_db_parameter_group.rds_parameter_group[0].name
}
