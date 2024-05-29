output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = module.rds_instance.db_instance_identifier
}

output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds_instance.db_instance_endpoint
}

output "db_password" {
  description = "Password of the RDS instance"
  value       = module.rds_instance.db_password_ssm_parameter
}
