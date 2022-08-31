resource "aws_codedeploy_app" "codedeploy" {
  compute_platform = "ECS"                #컴퓨팅 플랫폼 
  name             = "Project-CodeDeploy" #애플리케이션 이름
}
