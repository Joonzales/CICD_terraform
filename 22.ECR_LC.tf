resource "aws_ecr_lifecycle_policy" "Project-policy" {
  repository = aws_ecr_repository.ecr-repo.name

  policy = <<EOF

   {
  "rules": [
    {
      "rulePriority": 1,
      "description": "10개 이상이면 이미지 제거",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}
