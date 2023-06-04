resource "aws_vpc" "my_vpc" {

  cidr_block = var.my_vpc_cidr
   tags = {
    Name = var.my_vpc_tag
    }
}
resource "aws_subnet" "public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet1_cidr
  availability_zone = var.public_subnet1_az
  tags = {
    Name = var.public_subnet1_tag
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "my_igw"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
      Name = "my_route_table"
   }
}
resource "aws_route_table_association" "route_association" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}
resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = "vpc-05e9493fc3be00498"
  auto_accept   = true
}
resource "aws_route" "peer_route" {
  route_table_id            = aws_route_table.route_table.id
  destination_cidr_block    = "172.31.32.0/20"
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

output "vpc_id_value" {
 value = "${aws_vpc.my_vpc.id}"
}
output "subnet_id_value" {
 value = "${aws_subnet.public_subnet.id}"
}
output "route_table_id_value" {
 value = "${aws_route_table.route_table.id}"
}
