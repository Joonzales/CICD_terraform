resource "aws_lb_listener" "albli-blue" {
  load_balancer_arn = aws_alb.alb.arn
  port              = var.blue-port
  protocol          = var.lis-protocol
  depends_on = [
    aws_lb_target_group.alb-blue
  ]
  default_action {
    type             = var.lis-action-type
    target_group_arn = aws_lb_target_group.alb-blue.arn
  }
}

resource "aws_lb_listener" "albli-green" {
  load_balancer_arn = aws_alb.alb.arn
  port              = var.green-port
  protocol          = var.lis-protocol
  depends_on = [
    aws_lb_target_group.alb-green
  ]
  default_action {
    type             = var.lis-action-type
    target_group_arn = aws_lb_target_group.alb-green.arn
  }
}
