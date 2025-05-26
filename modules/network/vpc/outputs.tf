output "vpc_name" {
  description = "The name of the created VPC"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "The self link of the created VPC"
  value       = google_compute_network.vpc.self_link
}
