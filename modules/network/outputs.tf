output "subnet_ids" {
  value       = google_compute_subnetwork.this[*].id
  description = "List of subnet IDs created for GCP VPC"
}     

output "vpc_id" {
  value       = google_compute_network.this.id
  description = "The ID of the VPC network"
}

output "total_ha" {
  value       = local.total
  description = "High Availability Redundancy"
}
