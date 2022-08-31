resource "aws_route_table_association" "natass-ecsa" {
  subnet_id      = aws_subnet.ecsa.id
  route_table_id = aws_route_table.natrt.id
}

resource "aws_route_table_association" "natass-ecsc" {
  subnet_id      = aws_subnet.ecsc.id
  route_table_id = aws_route_table.natrt.id
}

resource "aws_route_table_association" "natass-dba" {
  subnet_id      = aws_subnet.dba.id
  route_table_id = aws_route_table.natrt.id
}

resource "aws_route_table_association" "natass-dbc" {
  subnet_id      = aws_subnet.dbc.id
  route_table_id = aws_route_table.natrt.id
}
