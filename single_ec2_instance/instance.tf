// create a key-pair and assign it to newly created instance
// create security gruop and assign to instance
# output "groudetisl" {
#   value = aws_security_group.allow_tls.id
# }


# create instance
resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = "key-tf"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("${path.module}/scripts.sh")
  tags = {
    Name = "cloudFront-test"
  }
}

