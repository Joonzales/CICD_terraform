resource "aws_iam_policy" "codebuild-policy" {
  name = "CodeBuild-Policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Resource" : "arn:aws:ecr:ap-northeast-2:${local.account_id}:repository/${var.ecr}"
        "Action" : [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "ecr:GetAuthorizationToken"
        ],
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Resource": [
            "arn:aws:s3:::${var.s3}*"
        ],
        "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:GetBucketAcl",
            "s3:GetBucketLocation"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudwatch:DescribeAlarmsForMetric",
          "cloudwatch:GetMetricData",
        ],
        "Resource" : [
          "arn:aws:logs:ap-northeast-2:${local.account_id}:log-group:/aws/codebuild/${var.project}",
          "arn:aws:logs:ap-northeast-2:${local.account_id}:log-group:/aws/codebuild/${var.project}:*",
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })

  tags = {
    "Name" = "AccessingECRRepositoryPolicy"
  }
}

# CodePipeline IAM Policy
## Codestar-connections을 사용할 수 있도록 codestar-connections:UseConnection 허용
## 아티팩트 스토어로 S3 버킷을 사용할 수 있도록 S3에 대해 객체 목록, 쓰기, 읽기, 권한 허용
## CodeBuild를 사용할 수 있도록 CodeBuild 사용 허용
## CodeDeploy를 사용할 수 있도록 CodeDeploy 사용 허용
## ECS에 배포할 수 있도록 ECS 작업 정의 등록 허용
## ECS가 작업을 수행할 수 있도록 
resource "aws_iam_policy" "codepipeline-policy" {
  name = "CodePipeline-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "codestar-connections:UseConnection"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket",
          "s3:GetObjectVersion",
          "s3:GetObject",
          "s3:GetBucketLocation"
          
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild",
          "codebuild:BatchGetBuildBatches",
          "codebuild:StartBuildBatch"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "codedeploy:CreateDeployment",
          "codedeploy:GetApplication",
          "codedeploy:GetApplicationRevision",
          "codedeploy:GetDeployment",
          "codedeploy:GetDeploymentConfig",
          "codedeploy:RegisterApplicationRevision"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "ecs:RegisterTaskDefinition"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      },
      {
        "Action" : [
          "iam:PassRole"
        ],
        "Resource" : "*",
        "Effect" : "Allow",
        "Condition" : {
          "StringEqualsIfExists" : {
            "iam:PassedToService" : [
              "ecs-tasks.amazonaws.com"
            ]
          }
        }
      }
    ]
  })
}