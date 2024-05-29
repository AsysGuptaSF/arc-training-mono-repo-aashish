variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
}

variable "ssh_key" {
  description = "The name of the SSH Key that should be used to access the instance"
  type        = string
}

variable "ssh_key_path" {
  description = "Local path to store SSH key"
  type        = string
}

variable "auto_assign_public_ip_enabled" {
  description = "Whether a public IP address is automatically assigned to the primary network interface of the instance in a VPC"
  type        = bool
}

variable "volume_type" {
  description = "The type of the volume"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume in GB"
  type        = number
}

variable "encrypted" {
  description = "Whether the volume should be encrypted"
  type        = bool
}

variable "delete_on_termination" {
  description = "Whether the volume should be deleted when the instance is terminated"
  type        = bool
}

variable "availability_zone" {
  description = "AZ (Availability Zone) to create the resources in."
  type        = string
  default     = null
}

variable "additional_volumes" {
  description = "A list of additional volumes to attach to the instance"
  type = list(object({
    device_name = string
    volume_type = string
    volume_size = number
    encrypted   = bool

  }))
  default = []
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
  description = "A map of ingress rules"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
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
}
