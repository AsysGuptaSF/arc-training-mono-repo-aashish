variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
  default     = null
}

variable "ami" {
  description = "The AMI to run on the instance."
  type        = string
  default     = null
}

variable "ssh_key" {
  description = "The name of the SSH Key that should be used to access the instance."
  type        = string
  default     = null
}

variable "auto_assign_public_ip_enabled" {
  description = "Whether a public IP address is automatically assigned to the primary network interface of the instance in a VPC."
  type        = bool
  default     = null
}

variable "availability_zone" {
  description = "AZ (Availability Zone) to create the instance in."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of subnet in which to launch the instance."
  type        = string
  default     = null
}


variable "volume_type" {
  description = "The type of the volume"
  type        = string
  default     = "gp3"
}

variable "volume_size" {
  description = "The size of the volume in GB"
  type        = number
  default     = 30
}

variable "encrypted" {
  description = "Whether the volume should be encrypted"
  type        = bool
  default     = true
}

variable "delete_on_termination" {
  description = "Whether the volume should be deleted when the instance is terminated"
  type        = bool
  default     = true
}

variable "additional_volumes" {
  description = "A list of additional volumes to attach to the instance"
  type = list(object({
    device_name = string
    volume_type = string
    volume_size = number
    encrypted   = bool
  }))
  default = [] # Default to an empty list
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




