resource "aws_appautoscaling_target" "ecs-target" {
  max_capacity       = var.max                                                                           #최대용량
  min_capacity       = var.min                                                                           #최소용량
  resource_id        = "service/${aws_ecs_cluster.ecs-cluster.name}/${aws_ecs_service.ecs-service.name}" #조정 정책과 연결된 리소스
  scalable_dimension = "ecs:service:DesiredCount"                                                        #API 
  service_namespace  = "ecs"
}
