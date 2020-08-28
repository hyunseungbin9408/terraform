resource "aws_security_group" "sg-ssh-pub" {
  vpc_id = aws_vpc.AZ_VPC.id
  name   = "allow-ssh-pub"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MGMT_IP]
  }

  tags = {
    Name = "allow-ssh-pub"
  }
}

resource "aws_security_group" "sg-ssh-priv" {
  vpc_id = aws_vpc.AZ_VPC.id
  name   = "allow-ssh-priv"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.CIDR]
  }

  tags = {
    Name = "allow-ssh-priv"
  }
}

resource "aws_security_group" "sg-web-pub" {
  vpc_id = aws_vpc.AZ_VPC.id
  name   = "allow-web-pub"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-web-pub"
  }
}