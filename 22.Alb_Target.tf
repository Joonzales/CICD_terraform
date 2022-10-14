resource "aws_lb_target_group" "alb-blue" {
  name        = "blue"
  port        = var.blue-port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = var.health-threshold-check
    interval            = var.health-interval-check
    matcher             = var.health-matcher
    path                = var.health-check-path
    port                = var.health-port
    protocol            = var.health-protocol
    timeout             = var.health-timeout
    unhealthy_threshold = var.health-unhealthy
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "alb-green" {
  name        = "green"
  port        = var.green-port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    protocol            = var.health-protocol
    path                = var.health-check-path
    healthy_threshold   = var.health-threshold-check
    unhealthy_threshold = var.health-unhealthy
    timeout             = var.health-timeout
    interval            = var.health-interval-check
    matcher             = var.health-matcher
    port                = var.health-port
  }
  lifecycle {
    create_before_destroy = true
  }
}
