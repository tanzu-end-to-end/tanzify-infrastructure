data "aws_subnet" "public_subnets" {


}

resource "aws_lb" "harbor" {
  name                             = "${var.environment_name}-harbor"
  load_balancer_type               = "network"
  enable_cross_zone_load_balancing = true
  internal                         = false
  subnets                          = var.public_subnet_ids
}

resource "aws_lb_listener" "harbor_443" {
  load_balancer_arn = aws_lb.harbor.arn
  port              = 443
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.harbor_443.arn
  }
}

resource "aws_lb_target_group" "harbor_443" {
  name     = "${var.environment_name}-harbor-tg-443"
  port     = 443
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 6
    unhealthy_threshold = 6
    interval            = 10
    protocol            = "TCP"
  }
}

resource "aws_lb_listener" "harbor_80" {
  load_balancer_arn = aws_lb.harbor.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.harbor_80.arn
  }
}

resource "aws_lb_target_group" "harbor_80" {
  name     = "${var.environment_name}-harbor-tg-80"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 6
    unhealthy_threshold = 6
    interval            = 10
    protocol            = "TCP"
  }
}
