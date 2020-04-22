# instance

resource "aws_instance" "this" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.this.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  user_data     = var.user_data != "" ? var.user_data : data.template_file.setup.rendered
  key_name      = var.key_name != "" ? var.key_name : var.name

  iam_instance_profile = aws_iam_instance_profile.this.id

  vpc_security_group_ids = [
    aws_security_group.this.id,
  ]

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = false
  }

  tags = {
    Name = var.name
    Type = "keycloak"
  }
}
