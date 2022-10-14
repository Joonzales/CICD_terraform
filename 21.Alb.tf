resource "aws_alb" "alb" {
  name            = "3team"
  internal        = false
  subnets         = [aws_subnet.puba.id, aws_subnet.pubc.id]
  security_groups = [aws_security_group.sg.id]
  tags = {
    "Name" = "3team"
  }
}
