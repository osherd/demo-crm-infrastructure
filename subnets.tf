

resource "google_compute_subnetwork" "public" {
  # Create a public subnet
  name          = "public"
  ip_cidr_range = local.subnet_cidr
  region        = local.region
  network       = google_compute_network.vpc.id
  project       = local.project_id
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "private" {
  # Create a private subnet
  name          = "private"
  ip_cidr_range = local.subnet_cidr_private
  region        = local.region
  network       = google_compute_network.vpc.id
  project       = local.project_id
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"

  
  # Create secondary IP ranges for the private subnet
  # These ranges are used for Kubernetes pods and services
  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = local.subnet_cidr_k8s-pods
  }
  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = local.subnet_cidr_k8s-services
  }
  
}