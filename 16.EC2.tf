resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key-pair
  vpc_security_group_ids      = [aws_security_group.sg.id]
  availability_zone           = var.az["aza"]
  subnet_id                   = aws_subnet.puba.id
  associate_public_ip_address = true
  tags = {
    "Name" = "Project-Bastion"
  }
}
