resource "aws_ecs_cluster_capacity_providers" "ecs-cluster-capa" {
  cluster_name = aws_ecs_cluster.ecs-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = 2
    weight            = 100
  }
}
