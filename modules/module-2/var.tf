variable "ami_instance" {
    type = string
    value = "ami-0ed99df77a82560e6"
} 

variable "instance_name"{
    type = string
   value = "my_default_instance"
}

variable "instance_type" {
    type = string
    value = "t2.medium"
}

variable "instance_name2"{
    type = string
   value = "worker-1"
}

variable "instance_type2" {
    type = string
    value = "t2.micro"
}

variable "instance_name3"{
    type = string
   value = "worker-2"
}

variable "instance_type3" {
    type = string
    value = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "tokyo"
}

variable "subnet_id" {
 type = string
 value =
}

variable "vpc_id" {
    type = string
    value =
}
