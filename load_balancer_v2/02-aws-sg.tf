# creating security group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow ssh and lb traffic"

  ingress {
    description = "For ssh connectivity"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description     = "For lb connectivity"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.ALBSGT.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

// this group is for ALB
resource "aws_security_group" "ALBSGT" {
  name        = "ALBSGT"
  description = "Allow Http traffic"

  ingress {
    description = "For http connectivity"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ALBSGT"
  }
}
