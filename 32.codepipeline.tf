resource "aws_codepipeline" "codepipeline" {
  # Codepipeline 생성 Step 1: 파이프라인 설정
  name     = "Project-pipeline"                 #파이프 라인 네임
  role_arn = aws_iam_role.codepipeline-role.arn #CodePipeLine Role

  # Codepipeline 생성 Step 1: 고급 설정 - 아티팩트 스토어
  artifact_store {
    location = aws_s3_bucket.codepipeline-bucket.bucket
    type     = "S3"
  }

  # Codepipeline 생성 Step 2: 소스 스테이지 추가
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = 1
      output_artifacts = ["SourceArtifact"]
      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github-connection.arn
        FullRepositoryId = "Joonzales/app"
        BranchName       = "main"
      }
    }
  }

  # Codepipeline 생성 Step 3: 빌드 스테이지 추가
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = 1
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      namespace        = "BuildVariables"
      configuration = {
        ProjectName = "Project"
      }
    }
  }

  # Codepipeline 생성 Step 4: 배포 스테이지 추가
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      version         = 1
      input_artifacts = ["BuildArtifact", "SourceArtifact"]
      configuration = {
        ApplicationName                = aws_codedeploy_app.codedeploy.name
        DeploymentGroupName            = "Project-DeployGroup"
        TaskDefinitionTemplateArtifact = "SourceArtifact"
        TaskDefinitionTemplatePath     = "taskdef.json"
        AppSpecTemplateArtifact        = "SourceArtifact"
        AppSpecTemplatePath            = "appspec.yaml"
        Image1ArtifactName             = "BuildArtifact"
        Image1ContainerName            = "IMAGE1_NAME"

      }
    }
  }
}
