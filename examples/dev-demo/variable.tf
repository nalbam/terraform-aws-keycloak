# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "dev-demo-keycloak"
}

variable "vpc_id" {
  default = "vpc-075279b4e48b983ff"
}

variable "subnet_id" {
  default = "subnet-08a5b599722126606"
}

variable "public_subnet_ids" {
  default = [
    "subnet-007a2bd91c7939e85",
    "subnet-0477597c240b95aa8",
    "subnet-0c91c5cd95b319b76",
  ]
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "0.0.0.0/0", # all
    # "221.148.35.250/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

variable "key_name" {
  default = "nalbam-seoul"
}

variable "dns_name" {
  default = ""
}

variable "dns_root" {
  default = "nalbam.com"
}

variable "slack_token" {
  default = "T03FUG4UB/B8RQJGNR0/U7LtWJKf8E2gVkh1S1oASlG5"
}
