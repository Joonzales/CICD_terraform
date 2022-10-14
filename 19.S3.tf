# Codepipeline 생성 시 필요한 Artifact store 생성
resource "aws_s3_bucket" "codepipeline-bucket" {
  bucket        = var.s3
  force_destroy = true
}

# 위에서 생성되는 S3 Bucket의 ACL 비활성화
resource "aws_s3_bucket_acl" "codepipeline-bucket-acl" {
  bucket = aws_s3_bucket.codepipeline-bucket.id
  acl    = "private"
}
