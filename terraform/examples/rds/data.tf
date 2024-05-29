data "aws_subnets" "arc_rds_pvt_subnets" {
  filter {
    name   = "tag:Name"
    values = ["arc_poc_vpc-private-subnet-2", "arc_poc_vpc-private-subnet-1", "arc_poc_vpc-private-subnet-3"]
  }
}

data "aws_vpc" "arc_poc_vpc" {
  filter {
    name   = "tag:Name"
    values = ["arc_poc_vpc"]
  }
}