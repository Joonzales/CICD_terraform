# AWS ID
data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
}

# Region
variable "region" {
  type    = string
  default = "ap-northeast-2"
}

# Key Pair
variable "key-pair" {
  type    = string
  default = "Project-KEY"
}

# Key Pair Location
variable "key-path" {
  type    = string
  default = "../Key/hjjeong.pub"
}

# CIDR-Block
variable "cidr-block" {
  type = map(any)
  default = {
    vpc  = "100.0.0.0/16"
    puba = "100.0.0.0/24"
    pubc = "100.0.1.0/24"
    ecsa = "100.0.2.0/24"
    ecsc = "100.0.3.0/24"
    dba  = "100.0.4.0/24"
    dbc  = "100.0.5.0/24"
    all  = "0.0.0.0/0"
  }
}

# Availablity Zone
variable "az" {
  type = map(any)
  default = {
    "aza" = "ap-northeast-2a"
    "azb" = "ap-northeast-2b"
    "azc" = "ap-northeast-2c"
    "azd" = "ap-northeast-2d"
  }
}

# Port
variable "ssh-port" {
  default = 22
}
variable "http-port" {
  default = 80
}
variable "blue-port" {
  default = 80
}
variable "green-port" {
  default = 8080
}
variable "mysql-port" {
  default = 3306
}

# EC2
variable "ami" {
  type    = string
  default = "ami-0c76973fbe0ee100c"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#RDS
variable "db-storage-size" {
  default = 20
}
variable "db-engine" {
  type    = string
  default = "mysql"
}
variable "db-engine-version" {
  type    = string
  default = "5.7"
}
variable "db-instance" {
  type    = string
  default = "db.t2.micro"
}
variable "db-identifier" {
  type    = string
  default = "wordpress"
}
variable "db-name" {
  type    = string
  default = "wordpress"
}
variable "db-user" {
  type    = string
  default = "root"
}
variable "db-password" {
  type    = string
  default = "It12345!"
}
variable "db-parameter" {
  type    = string
  default = "default.mysql5.7"
}


# ALB Health Check
variable "health-protocol" {
  type    = string
  default = "HTTP"
}
variable "health-check-path" {
  type    = string
  default = "/"
}
variable "health-threshold-check" {
  default = 5
}
variable "health-unhealthy" {
  default = 2
}
variable "health-timeout" {
  default = 5
}
variable "health-interval-check" {
  default = 30
}
variable "health-matcher" {
  type    = string
  default = "200"
}
variable "health-port" {
  type    = string
  default = "traffic-port"
}

# ALB Listner
variable "lis-protocol" {
  type    = string
  default = "HTTP"
}
variable "lis-action-type" {
  type    = string
  default = "forward"
}

# ECR Repository
variable "ecr" {
  type    = string
  default = "projectrepository"
}

# Project Name
variable "project" {
  type    = string
  default = "3team"
}

# ECS Task Definition
variable "ecs-family" {
  type    = string
  default = "Project-taskdef"
}
variable "ecs-cpu" {
  default = 512
}
variable "ecs-memory" {
  default = 1024
}
variable "container-hostport" {
  default = 80
}
variable "container-port" {
  default = 80
}
variable "container-protocol" {
  type    = string
  default = "tcp"
}
variable "container-cpu" {
  default = 256
}
variable "container-memory" {
  default = 512
}

# Route 53
variable "route53-dns" {
  type    = string
  default = "hjjeong.xyz"
}
variable "route53-port" {
  type    = string
  default = "80"
}
variable "route53-type" {
  type    = string
  default = "HTTP"
}
variable "route53-resource-path" {
  type    = string
  default = "/"
}
variable "route53-failure-threshold" {
  type    = string
  default = "3"
}
variable "route53-request-interval" {
  type    = string
  default = "10"
}
variable "route53-record" {
  type    = string
  default = "A"
}

# S3 
variable "s3" {
  type    = string
  default = "project-codepipeline-bucket"
}


# ECS Auto Scaling
variable "max" {
  default = 10
}
variable "min" {
  default = 2
}

