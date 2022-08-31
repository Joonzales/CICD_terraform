provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key-pair" {
    key_name = var.key-pair
    public_key = file("${var.key-path}")
}