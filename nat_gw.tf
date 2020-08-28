resource "aws_eip" "vpc-eip" {
  vpc = true
}

resource "aws_nat_gateway" "vpc-gw" {
  allocation_id = aws_eip.vpc-eip.id
  subnet_id     = aws_subnet.AZ_pub[0].id
  depends_on    = [aws_internet_gateway.igw]
}

resource "aws_route_table" "route-nat" {
  vpc_id = aws_vpc.AZ_VPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vpc-gw.id
  }
}

resource "aws_route_table_association" "main-private" {
  subnet_id      = aws_subnet.AZ_priv[0].id
  route_table_id = aws_route_table.route-nat.id
}