resource "aws_vpc" "AZ_VPC" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "vpc2a"
  }
}

## public subnets

resource "aws_subnet" "AZ_pub" {
  count                   = 3
  cidr_block              = cidrsubnet("192.168.0.0/16", 8, (count.index + 1) * 10)
  vpc_id                  = aws_vpc.AZ_VPC.id
  map_public_ip_on_launch = "true"
  availability_zone       = var.AZS[count.index]

  tags = {
    Name = "vpc2a"
  }
}

## private subnets

resource "aws_subnet" "AZ_priv" {
  count                   = 3
  cidr_block              = cidrsubnet("192.168.0.0/16", 8, (count.index + 4) * 10)
  vpc_id                  = aws_vpc.AZ_VPC.id
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZS[count.index]

  tags = {
    Name = "vpc2a"
  }
}