resource "aws_instance" "virtual_machine" {

  instance_type               = var.instance_type
  ami                         = var.ami
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = var.auto_assign_public_ip_enabled
  subnet_id                   = var.subnet_id
  security_groups             = [aws_security_group.instance_security_group.id]

  tags = {
    Name = "arc_poc_vm"
    Env  = "poc"
  }


  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination


    tags = {
      Name = "arc_poc_vol"
      Env  = "poc"
    }

  }
}

# Attach additional volumes
resource "aws_volume_attachment" "additional_volumes" {
  count       = length(var.additional_volumes)
  instance_id = aws_instance.virtual_machine.id
  device_name = var.additional_volumes[count.index].device_name
  volume_id   = aws_ebs_volume.additional_volumes[count.index].id
}

# Create additional EBS volumes
resource "aws_ebs_volume" "additional_volumes" {
  count             = length(var.additional_volumes)
  availability_zone = var.availability_zone
  size              = var.additional_volumes[count.index].volume_size
  type              = var.additional_volumes[count.index].volume_type
  encrypted         = var.additional_volumes[count.index].encrypted
}

# Security group creation
resource "aws_security_group" "instance_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

#SSH key generation
resource "tls_private_key" "ssh_key_generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ssh_key
  public_key = tls_private_key.ssh_key_generate.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key_generate.private_key_pem}' > ../../../${var.ssh_key}.pem"
  }
}

