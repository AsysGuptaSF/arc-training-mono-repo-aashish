instance_type                 = "t2.micro"
ami                           = "ami-0bb84b8ffd87024d8"
auto_assign_public_ip_enabled = false
subnet_id                     = "subnet-6781cb49"
availability_zone             = "us-east-1a"
volume_type                   = "gp3"
volume_size                   = 30
encrypted                     = true
delete_on_termination         = true

additional_volumes = [
  {
    device_name = "/dev/sdf"
    volume_type = "gp3"
    volume_size = 10
    encrypted   = true
  },
  {
    device_name = "/dev/sdg"
    volume_type = "gp3"
    volume_size = 10
    encrypted   = true
  }
]
security_group_name        = "instance_security_group"
security_group_description = "Security group for the EC2 instance"
vpc_id                     = "vpc-68f96212"
ssh_key                    = "arc_poc"
