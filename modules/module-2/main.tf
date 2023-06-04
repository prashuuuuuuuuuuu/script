resource "aws_instance" "master" {
  ami           = var.ami_instance
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  key_name = var.key_pair
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name1
  }
}
resource "aws_instance" "worker-1" {
  ami           = var.ami_instance
  instance_type = var.instance_type2
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  key_name = var.key_pair
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name2
  }
}

resource "aws_instance" "worker-1" {
  ami           = var.ami_instance
  instance_type = var.instance_type3
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  key_name = var.key_pair
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name3
  }
}



resource "aws_security_group" "sg_public" {

  vpc_id      = var.vpc_id

  ingress {
    description      = "ssh connection"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    description      = "Kubernetes API server"
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "etcd server client API"
    from_port        = 2379
    to_port          = 2379
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "etcd server client API"
    from_port        = 2380
    to_port          = 2380
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "Kubelet API"
    from_port        = 10250
    to_port          = 10250
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "kube-scheduler"
    from_port        = 10259
    to_port          = 10259
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "kube-controller-manager"
    from_port        = 10257
    to_port          = 10257
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "FPOC-teraform_sg"
  }
}
