################################################################
## shared
################################################################
variable "environment" {
  type        = string
  description = "Name of the environment, i.e. dev, stage, prod"
  default     = "dev"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}

variable "namespace" {
  type        = string
  description = "Namespace of the project, i.e. refarch"
  default     = "example"
}

################################################################
## network
################################################################
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to deploy resources in."
  default = [
    "us-west-2a",
    "us-west-2b"
  ]
}

variable "vpc_ipv4_primary_cidr_block" {
  type        = string
  description = "IPv4 CIDR block for the VPC to use."
  default     = "10.0.0.0/16"
}

