
resource "aws_security_group" "harbor_lb_security_group" {
  name        = "harbor_lb_security_group"
  description = "Harbor LB Security Group"
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  tags = merge(
  var.tags, { "name" = "${var.environment_name}-harbor-lb-security-group" },)
}

