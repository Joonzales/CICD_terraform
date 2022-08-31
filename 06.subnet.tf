#Public Zone 
resource "aws_subnet" "puba" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["puba"]
  availability_zone = var.az["aza"]
  tags = {
    "Name" = "puba"
  }
}

resource "aws_subnet" "pubc" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["pubc"]
  availability_zone = var.az["azc"]
  tags = {
    "Name" = "pubc"
  }
}

#Private Zone
resource "aws_subnet" "ecsa" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["ecsa"]
  availability_zone = var.az["aza"]
  tags = {
    "Name" = "ecsa"
  }
}

resource "aws_subnet" "ecsc" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["ecsc"]
  availability_zone = var.az["azc"]
  tags = {
    "Name" = "ecsc"
  }
}

resource "aws_subnet" "dba" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["dba"]
  availability_zone = var.az["aza"]
  tags = {
    "Name" = "dba"
  }
}

resource "aws_subnet" "dbc" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr-block["dbc"]
  availability_zone = var.az["azc"]
  tags = {
    "Name" = "dbc"
  }
}
