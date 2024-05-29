aws_region                    = "us-east-1"
instance_type                 = "t2.micro"
auto_assign_public_ip_enabled = false
volume_type                   = "gp3"
volume_size                   = 30
encrypted                     = true
delete_on_termination         = true
ssh_key_path                  = "../.."
availability_zone             = "us-east-1b"
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
ssh_key                    = "arc_poc"
ingress_rules = {
  ssh = {
    description = "SSH allowed for all"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  http = {
    description = "HTTP allowed for all"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
egress_rules = {
  all_traffic = {
    description = "All outbound traffic allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
