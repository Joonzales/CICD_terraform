resource "aws_alb" "alb" {
  name            = "Project-alb"
  internal        = false
  subnets         = [aws_subnet.puba.id, aws_subnet.pubc.id]
  security_groups = [aws_security_group.sg.id]
  tags = {
    "Name" = "Project-alb"
  }
}
