output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.virtual_machine.id
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.instance_security_group.id
}

output "private_key_location" {
  description = "The location where the private key is saved"
  value       = "../../${var.ssh_key}.pem"
}

output "ebs_volumes" {
  description = "Information about the created EBS volumes"
  value = [
    for volume in aws_ebs_volume.additional_volumes :
    {
      id   = volume.id
      size = volume.size
      type = volume.type
    }
  ]
}
