// create aws_key_pair
resource "aws_key_pair" "kay-lb" {
  key_name   = "key-lb"
  public_key = file("${path.module}/id_rsa.pub")
}
