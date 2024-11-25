resource "aws_subnet" "subnet_public_a" {
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.8.64.0/26"

  tags = {
    Name = "subnet-public-a"
  }
}

resource "aws_subnet" "subnet_public_b" {
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block = "10.8.64.64/26"

  tags = {
    Name = "subnet-public-b"
  }
}

resource "aws_route_table" "rtb_public_a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "rtb_public_b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "tra_public_a" {
  subnet_id = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.rtb_public_a.id
}

resource "aws_route_table_association" "tra_public_b" {
  subnet_id = aws_subnet.subnet_public_b.id
  route_table_id = aws_route_table.rtb_public_b.id
}