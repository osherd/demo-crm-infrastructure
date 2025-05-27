variable "ha" {
  type        = number
  default     = 3
  description = "High Availability Redundancy (e.g., number of GKE nodes or zones)"
}

variable "vpc_cidrs" {
  description = "VPC CIDRs for primary subnet(s)"
  type        = string
}

variable "common_tags" {
  type = map(string)
  default = {
    owner     = "terraform-ks"
    managedBy = "terraform"
    usage     = "training"
    app_name  = "demo-crm"
  }
  description = "Standard labels/tags to apply to resources"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "GCP region for resources"
}

variable "cluster_version" {
  type        = string
  description = "GKE cluster version"
}

variable "node_type" {
  type        = string
  description = "GCE machine type for GKE nodes (e.g., e2-medium)"
}

variable "project_id" {
  type        = string
  description = "GCP project ID for resources"
}
