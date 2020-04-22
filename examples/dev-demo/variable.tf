# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "dev-demo-keycloak"
}

# variable "vpc_id" {
#   default = "vpc-025ad1e9d1cb3c27d"
# }

# variable "subnet_id" {
#   default = "subnet-09a6bcc0e50e97446"
# }

# variable "public_subnet_ids" {
#   default = [
#     "subnet-007a2bd91c7939e85",
#     "subnet-0477597c240b95aa8",
#     "subnet-0c91c5cd95b319b76",
#   ]
# }

variable "keycloak_version" {
  default = "9.0.3"
}

variable "allow_ssh_sg" {
  default = "sg-01c7ee8427eb8358b"
}

variable "allow_ip_address" {
  type = list(string)
  default = [
    "0.0.0.0/0", # all
    # "211.60.50.190/32", # echo "$(curl -sL icanhazip.com)/32"
  ]
}

variable "key_name" {
  default = "nalbam-seoul"
}

variable "dns_name" {
  default = ""
}

variable "dns_root" {
  default = "mzdev.be"
}

variable "slack_token" {
  default = "T03FUG4UB/B8RQJGNR0/U7LtWJKf8E2gVkh1S1oASlG5"
}
