resource "aws_vpc" "main" {
  cidr_block = var.vpc_cider
  # cidr_block = "172.17.0.0/16"


  tags = {
    Name = "vpc-${var.env}"
  }
}
