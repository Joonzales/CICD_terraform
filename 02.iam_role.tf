resource "aws_iam_role" "codebuild-role" {
  name = "CodeBuild-Role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "codebuild.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    "Name" = "CodeBuildRole"
  }
}

resource "aws_iam_role" "codedeploy-role" {
  name = "CodeDeploy-Role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : ["sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "codedeploy.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    "Name" = "CodeDeployRole"
  }
}

resource "aws_iam_role" "ecs-task-execution-role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role" "codepipeline-role" {
  name = "CodePipeline-Role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "codepipeline.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role" "ecs-auto-scale-role" {
  name = "ECS-Auto-Scale-Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "application-autoscaling.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
