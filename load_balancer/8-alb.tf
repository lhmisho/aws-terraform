
resource "aws_lb_target_group" "green-tg" {
  name       = "green-tg"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = aws_vpc.main.id
  slow_start = 0
  health_check {
    enabled             = true
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
    protocol            = "HTTP"
    path                = "/"
  }

}

resource "aws_lb_target_group_attachment" "test" {
  for_each = aws_instance.web

  target_group_arn = aws_lb_target_group.green-tg.arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ALBSGT.id]
  subnets            = [aws_subnet.public_us_east_1a.id, aws_subnet.public_us_east_1b.id, aws_subnet.public_us_east_1c.id]


  #   enable_deletion_protection = true

  #   access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.id
  #     prefix  = "test-lb"
  #     enabled = true
  #   }

  tags = {
    Environment = "test"
  }
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  #   ssl_policy        = "ELBSecurityPolicy-2016-08"
  #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.green-tg.arn
  }
}
