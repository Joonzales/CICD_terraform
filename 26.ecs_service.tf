resource "aws_ecs_service" "ecs-service" {                                    #ECS 서비스 생성
  name                              = "Project-ecs-service"                   #ECS 서비스 Name
  cluster                           = aws_ecs_cluster.ecs-cluster.id          #클러스터 ID
  task_definition                   = aws_ecs_task_definition.ecs-taskdef.arn #작업 정의 ARN
  desired_count                     = 2                                       #컨테이너 개수 
  launch_type                       = "FARGATE"                               #시작 유형 
  health_check_grace_period_seconds = 180                                     #헬스체크 상태 확인 실패 무시 시간

  network_configuration {                                       #네트워크 구성 
    subnets          = [aws_subnet.ecsa.id, aws_subnet.ecsc.id] #서브넷 
    security_groups  = [aws_security_group.sg.id]               #보안 그룹
    assign_public_ip = false                                    #공용 IP 할당 
  }

  load_balancer {                                       #로드 밸런서
    target_group_arn = aws_lb_target_group.alb-blue.arn #ALB ARN
    container_name   = "app"                            #컨테이너 이름
    container_port   = 80                               #컨테이너 포트 
  }

  deployment_controller { #배포 컨트롤러 구성 
    type = "CODE_DEPLOY"  #CODE_DEPLOY 배포 
  }
}
