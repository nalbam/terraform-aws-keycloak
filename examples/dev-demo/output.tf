# output

output "name" {
  value = module.keycloak.name
}

output "private_ip" {
  value = module.keycloak.private_ip
}

output "dns_name" {
  value = module.keycloak.dns_name
}
