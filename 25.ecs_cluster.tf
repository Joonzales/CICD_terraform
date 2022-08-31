resource "aws_ecs_cluster" "ecs-cluster" {
  name = "Project-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs" {
  name = "/ecs/Project-taskdef"
}
