resource "aws_route_table_association" "puba-ass" {
  subnet_id      = aws_subnet.puba.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "pubc-ass" {
  subnet_id      = aws_subnet.pubc.id
  route_table_id = aws_route_table.rt.id
}