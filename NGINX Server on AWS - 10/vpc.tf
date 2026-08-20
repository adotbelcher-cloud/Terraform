resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "custom_private_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-private-subnet"
  }
}

resource "aws_subnet" "custom_public_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "terraform-public-subnet"
  }
}

resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "terraform-igw"
  }
}

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id

  }

  tags = {
    Name = "terraform-public-route-table"
  }
}

resource "aws_route_table_association" "custom_route_table_association" {
  subnet_id      = aws_subnet.custom_public_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}