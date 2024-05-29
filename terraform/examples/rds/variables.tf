variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "db_password_parameter_name" {
  description = "Name of the SSM parameter to store the DB password"
  type        = string
}

variable "use_existing_subnet_group" {
  description = "Whether to use an existing DB subnet group"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "use_existing_parameter_group" {
  description = "Whether to use an existing DB parameter group"
  type        = bool
  default     = false
}

variable "db_parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "db_parameter_group_family" {
  description = "Family of the DB parameter group"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_identifier" {
  description = "Identifier for the database"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the database"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database"
  type        = number
}

variable "db_storage_type" {
  description = "Storage type for the database"
  type        = string
}

variable "storage_encrypted" {
  description = "Whether the storage is encrypted"
  type        = bool
  default     = true
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage for the database"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot on deletion"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}


variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "Egress rules for the security group"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
