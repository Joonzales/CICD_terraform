resource "aws_security_group" "sg" {
  name        = "Project-sg"
  description = "Allow 22, 80, 10080, 5432, icmp"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
    {
      description      = "ssh"
      from_port        = var.ssh-port
      to_port          = var.ssh-port
      protocol         = "tcp"
      cidr_blocks      = ["${var.cidr-block["all"]}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "HTTP"
      from_port        = var.http-port
      to_port          = var.http-port
      protocol         = "tcp"
      cidr_blocks      = ["${var.cidr-block["all"]}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "HTTP"
      from_port        = var.green-port
      to_port          = var.green-port
      protocol         = "tcp"
      cidr_blocks      = ["${var.cidr-block["all"]}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "ICMP"
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["${var.cidr-block["all"]}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { description      = "mysql"
      from_port        = var.mysql-port
      to_port          = var.mysql-port
      protocol         = "tcp"
      cidr_blocks      = ["${var.cidr-block["all"]}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }

  ]

  egress = [{
    description      = "all"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["${var.cidr-block["all"]}"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = null
    security_groups  = null
    self             = null

  }]

  tags = {
    "Name" = "Project-sg"
  }
}
