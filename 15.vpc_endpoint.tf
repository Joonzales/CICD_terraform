resource "aws_vpc_endpoint" "vpcep-ecr-api" {
  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.ecr.api"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.ecsa.id, aws_subnet.ecsc.id]
  security_group_ids = [aws_security_group.sg.id]
  tags = {
    "Name" = "vpcep-ecr-api"
  }
}

resource "aws_vpc_endpoint" "vpcep-int-dkr" {
  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.ecr.dkr"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.ecsa.id, aws_subnet.ecsc.id]
  security_group_ids = [aws_security_group.sg.id]
  tags = {
    "Name" = "vpcep-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "vpcep-gat-s3" {
  vpc_id          = aws_vpc.vpc.id
  service_name    = "com.amazonaws.ap-northeast-2.s3"
  route_table_ids = [aws_route_table.rt.id]
  tags = {
    "Name" = "vpcep-gat-s3"
  }
}

resource "aws_vpc_endpoint" "vpce-logs" {
  vpc_id             = aws_vpc.vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.logs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.ecsa.id, aws_subnet.ecsc.id]
  security_group_ids = [aws_security_group.sg.id]
  tags = {
    "Name" = "vpce-logs"
  }
}
