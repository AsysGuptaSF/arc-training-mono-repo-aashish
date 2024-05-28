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