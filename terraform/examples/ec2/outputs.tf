output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "security_group_name" {
  value = module.ec2_instance.security_group_id
}


