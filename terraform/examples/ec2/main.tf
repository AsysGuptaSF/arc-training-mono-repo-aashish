module "ec2_instance" {
  source                        = "../../../modules/ec2"
  instance_type                 = var.instance_type
  ami                           = var.ami
  ssh_key                       = var.ssh_key
  auto_assign_public_ip_enabled = var.auto_assign_public_ip_enabled
  subnet_id                     = data.aws_subnet.arc_poc_subnet.id
  volume_type                   = var.volume_type
  volume_size                   = var.volume_size
  encrypted                     = var.encrypted
  availability_zone             = var.availability_zone
  delete_on_termination         = var.delete_on_termination
  additional_volumes            = var.additional_volumes
  security_group_name           = var.security_group_name
  security_group_description    = var.security_group_description
  ingress_rules                 = var.ingress_rules
  egress_rules                  = var.egress_rules
  vpc_id                        = data.aws_vpc.arc_poc_vpc.id
}
