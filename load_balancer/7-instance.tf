
locals {
  web_servers = {
    my-app-00 = {
      machine_type      = "t2.micro"
      subnet_id         = aws_subnet.private_us_east_1a.id
      availability_zone = "us-east-1a"
    }
    my-app-01 = {
      machine_type      = "t2.micro"
      subnet_id         = aws_subnet.private_us_east_1b.id
      availability_zone = "us-east-1b"
    }
    my-app-02 = {
      machine_type      = "t2.micro"
      subnet_id         = aws_subnet.private_us_east_1c.id
      availability_zone = "us-east-1c"
    }
  }
}

resource "aws_instance" "web" {
  for_each = local.web_servers

  ami                         = var.image_id
  instance_type               = var.instance_type
  key_name                    = "key-lb"
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id, aws_security_group.ALBSGT.id]
  user_data                   = file("${path.module}/scripts.sh")
  associate_public_ip_address = true
  tags = {
    Name = each.key
  }
}
