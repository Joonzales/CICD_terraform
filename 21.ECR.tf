resource "aws_ecr_repository" "ecr-repo" {
  name         = var.ecr
  force_delete = true
  tags = {
    "Name" = "${var.ecr}"
  }
}
