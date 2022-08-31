resource "aws_route_table" "natrt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cidr-block["all"]
    gateway_id = aws_nat_gateway.natgt.id
  }
  tags = {
    "Name" = "Project-natrt"
  }
}
