
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.AZ_VPC.id
}

resource "aws_route_table" "route-pub" {
  vpc_id = aws_vpc.AZ_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "main-public" {
  count = 3
  subnet_id      = aws_subnet.AZ_pub[count.index].id
  route_table_id = aws_route_table.route-pub.id
}