output "cluster_name" {
  value = module.gke.name
}

output "endpoint" {
  value = module.gke.endpoint
}

output "ca_certificate" {
  value = module.gke.ca_certificate
}
