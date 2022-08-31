resource "aws_db_subnet_group" "db_sub" {
  name       = "db-sub"
  subnet_ids = [aws_subnet.dba.id, aws_subnet.dbc.id]
  tags = {
    "Name" = "db-sub"
  }
}

resource "aws_db_instance" "Project" {
  allocated_storage      = var.db-storage-size
  engine                 = var.db-engine
  engine_version         = var.db-engine-version
  instance_class         = var.db-instance
  identifier             = var.db-name
  db_name                = var.db-name
  username               = var.db-user
  password               = var.db-password
  parameter_group_name   = var.db-parameter
  db_subnet_group_name   = aws_db_subnet_group.db_sub.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  skip_final_snapshot    = true
  multi_az               = true
  publicly_accessible    = true
  tags = {
    "Name" = "Project-DB"
  }
}
