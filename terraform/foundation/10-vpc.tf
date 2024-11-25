resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC-Main"
  }
}

resource "aws_eip" "eip_egress" {
  tags = {
    Name = "EIP-NGW"
  }
}

resource "aws_nat_gateway" "ntg_public" {
  subnet_id = aws_subnet.subnet_public_a.id
  allocation_id = aws_eip.eip_egress.id

  tags = {
    Name = "NATGW-public"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW-VPC-Main"
  }
}