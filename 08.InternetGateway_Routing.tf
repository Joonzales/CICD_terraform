resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cidr-block["all"]
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    "Name" = "Project-rt"
  }
}
