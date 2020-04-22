# data

data "aws_caller_identity" "current" {
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "terraform-mz-demo-seoul"
    key    = "vpc-demo.tfstate"
  }
}
