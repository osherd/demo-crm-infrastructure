output "network_name" {
  value = module.vpc.network_name
}

output "subnet_names" {
  value = module.vpc.subnets_names
}
output "subnet_self_links" {
  value = module.vpc.subnets_self_links
}