data "aws_vpc" "arc_poc_vpc" {
  filter {
    name   = "tag:Name"
    values = ["arc_poc_vpc"]
  }
}

data "aws_subnet" "arc_poc_subnet" {
  filter {
    name   = "tag:Name"
    values = ["arc_poc_vpc-private-subnet-2"]
  }
}

data "aws_ami" "arc_poc_latest_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}