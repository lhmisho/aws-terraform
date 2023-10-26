// create aws_key_pair
resource "aws_key_pair" "kay-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}
