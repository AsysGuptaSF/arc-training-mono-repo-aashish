variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "db_engine" {
  description = "The database engine type"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The database engine version to use"
  type        = string
  default     = "16.3"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "example"
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "example"
}

variable "db_instance_class" {
  description = "The RDS instance class"
  type        = string
  default     = "db.t2.micro"
}


variable "db_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = true
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
}


variable "skip_final_snapshot" {
  description = "Whether to skip the final DB snapshot during termination"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = "my-db-subnet-group"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}


variable "db_allocated_storage" {
  description = "The amount of storage (in GB) to be initially allocated for the database"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "The storage type to be associated with the RDS instance. Valid values are 'standard', 'gp2', or 'io1'."
  type        = string
  default     = "gp2"
}


variable "db_max_allocated_storage" {
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance."
  type        = number
  default     = 100
}


variable "use_existing_subnet_group" {
  description = "Flag to determine whether to use an existing subnet group"
  type        = bool
  default     = false
}

variable "db_password_parameter_name" {
  description = "The name of the SSM parameter that stores the database password"
  type        = string
  default     = null
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = "my-db-parameter-group"
}

variable "db_parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = null
}

variable "use_existing_parameter_group" {
  description = "Flag to determine whether to use an existing parameter group"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Flag to determine whether the DB instance is encrypted."
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "instance_security_group"
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for the EC2 instance"
}


variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string

}
variable "ingress_rules" {
  description = "A map of ingress rules"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    ssh = {
      description = "SSH Port allowed for all"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # Add more ingress rules as needed
  }
}

variable "egress_rules" {
  description = "A map of egress rules"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    all_traffic = {
      description = "All outbound traffic allowed"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # Add more egress rules as needed
  }
}





