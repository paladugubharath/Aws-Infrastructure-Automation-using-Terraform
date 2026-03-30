resource "aws_lb" "alb" {
  name = "devops-alb"
  load_balancer_type = "application"
  subnets = var.subnet_ids
  security_groups = [var.sg_id]
}

resource "aws_lb_target_group" "tg" {
  name     = "devops-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

data "aws_vpc" "default" {
  default = true
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}