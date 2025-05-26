variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "network" {
  type        = string
  description = "VPC network name"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork name"
}

variable "ip_range_pods" {
  type        = string
  description = "IP range for pods"
}

variable "ip_range_services" {
  type        = string
  description = "IP range for services"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for the cluster"
}
