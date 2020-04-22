# alb

resource "aws_alb" "this" {
  name = var.name

  subnets = var.public_subnet_ids

  security_groups = [
    aws_security_group.this.id
  ]

  tags = {
    Name = var.name
  }
}

resource "aws_alb_target_group" "this" {
  name     = var.name
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 10
    path                = "/login"
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.name
  }
}

resource "aws_alb_target_group_attachment" "this" {
  target_group_arn = aws_alb_target_group.this.arn
  target_id        = aws_instance.this.id
  port             = 8080
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.this.arn
    type             = "forward"
  }
}

resource "aws_alb_listener" "https" {
  count = var.dns_root != "" ? 1 : 0

  load_balancer_arn = aws_alb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.cert[0].arn

  default_action {
    target_group_arn = aws_alb_target_group.this.arn
    type             = "forward"
  }
}
