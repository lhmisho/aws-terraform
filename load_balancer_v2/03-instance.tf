// create a key-pair and assign it to newly created instance
// create security gruop and assign to instance

locals {
  web_servers = {
    my-app-00 = {
      machine_type      = "t2.micro"
      availability_zone = "us-east-1a"
    }
    my-app-01 = {
      machine_type      = "t2.micro"
      availability_zone = "us-east-1b"
    }
    my-app-02 = {
      machine_type      = "t2.micro"
      availability_zone = "us-east-1c"
    }
  }
}


resource "aws_instance" "web" {
  for_each = local.web_servers

  ami                    = var.image_id
  instance_type          = each.value.machine_type
  key_name               = "key-tf"
  availability_zone      = each.value.availability_zone
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("${path.module}/scripts.sh")
  tags = {
    Name = each.key
  }


  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("${path.module}/id_rsa")
  #   host        = self.public_ip
  # }

  ## file provitioner
  # provisioner "file" {
  #   source      = "readme.md"
  #   destination = "/tmp/readme.md"
  # }

  # content provitioner
  # provisioner "file" {
  #   content     = "this is my test content"
  #   destination = "/tmp/content.md"
  # }

  # folder/dir provitioner
  # provisioner "file" {
  #   source      = "test-folder"
  #   destination = "/tmp"
  # }
}
