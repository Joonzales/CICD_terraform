resource "aws_iam_role_policy_attachment" "codebuild-att" {
  role       = aws_iam_role.codebuild-role.name
  policy_arn = aws_iam_policy.codebuild-policy.arn
}

resource "aws_iam_role_policy_attachment" "codedeploy-att" {
  role       = aws_iam_role.codedeploy-role.name
  policy_arn ="arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS"
}

resource "aws_iam_role_policy_attachment" "ecs-att" {
  role       = aws_iam_role.ecs-task-execution-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs-autoscale-att" {
  role       = aws_iam_role.ecs-auto-scale-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole"
}

resource "aws_iam_role_policy_attachment" "codepipeline_att" {
  role = aws_iam_role.codepipeline-role.name
  policy_arn = aws_iam_policy.codepipeline-policy.arn
}