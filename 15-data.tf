# data

data "aws_ami" "this" {
  most_recent = true

  owners = ["137112412989"] # AWS's account ID.

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }
}

data "template_file" "setup" {
  template = file("${path.module}/template/setup.sh")

  vars = {
    DNS_NAME = local.dns_name
    TOKEN    = var.slack_token
  }
}
