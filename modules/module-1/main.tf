provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.aws_region
  map_public_ip_on_launch = true
  tags = {
    Name = "MainSubnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MainInternetGateway"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "MainRouteTable"
  }
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
