resource "aws_nat_gateway" "natgt" {
  allocation_id = aws_eip.natip.id
  subnet_id     = aws_subnet.puba.id
  tags = {
    "Name" = "Project-natgt"
  }
}
