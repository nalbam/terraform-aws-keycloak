# security group

resource "aws_security_group" "this" {
  name        = var.name
  description = "security group for ${var.name}"

  vpc_id = var.vpc_id

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  // ALL
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // SSH
  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = [var.allow_ssh_sg]
  }

  // HTTP
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = var.allow_ip_address
  }

  // HTTPS
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = var.allow_ip_address
  }

  tags = {
    Name = var.name
  }
}
