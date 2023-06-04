variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "20.0.0.0/16"
}

variable "vpc_tag"{
  description = "VPC-tag"
  value = "vpc1"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "20.0.0.0/24"
}

variable "subnet_tag"{
  description = "subnet-tag"
  value = "subnet1"
}

variable "peer_vpc_id" {
  description = "ID of the peer VPC"
}

variable "peer_vpc_region" {
  description = "Region of the peer VPC"
  default     = "us-west-2"
}

variable "peer_vpc_cidr_block" {
  description = "CIDR block of the peer VPC"
}
