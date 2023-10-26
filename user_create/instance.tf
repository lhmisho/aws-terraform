resource "aws_iam_user" "tf-user" {
  name = "tf-user"
}

output "printusername" {
  value = aws_iam_user.tf-user.name
}
