// Define AWS VPC with the 172.31.0.0/16 CIDR
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "HA-VPC"
  }
}
// Define VPC subnet with availability zone
resource "aws_subnet" "main_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = element(var.subnet_cidrs, 0) // reserve first subnet for the instance 
  availability_zone = element(var.az, 2) // "eu-central-1c"
  tags = {
    Name = "HA-Subnet"
  }
}
// Define the internet gateway for the VPC
resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "HA-Gateway"
  }
}
// Define the routing table for the VPC and subnets
resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.main_gw.id
  }

  tags = {
    Name = "HA-RT"
  }
}
// Define table association for the subnet 
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}
