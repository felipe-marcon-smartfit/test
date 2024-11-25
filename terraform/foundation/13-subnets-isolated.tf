resource "aws_subnet" "subnet_isolated_a" {
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.8.128.0/26"

  tags = {
    Name = "subnet-isolated-a"
  }
}

resource "aws_subnet" "subnet_isolated_b" {
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block = "10.8.128.64/26"

  tags = {
    Name = "subnet-isolated-b"
  }
}

resource "aws_route_table" "rtb_isolated_a" {
  vpc_id = aws_vpc.main.id
  
}

resource "aws_route_table" "rtb_isolated_b" {
  vpc_id = aws_vpc.main.id
  
}

resource "aws_route_table_association" "tra_isolated_a" {
  subnet_id = aws_subnet.subnet_isolated_a.id
  route_table_id = aws_route_table.rtb_isolated_a.id
}

resource "aws_route_table_association" "tra_isolated_b" {
  subnet_id = aws_subnet.subnet_isolated_b.id
  route_table_id = aws_route_table.rtb_isolated_b.id
}