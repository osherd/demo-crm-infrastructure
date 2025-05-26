

resource "google_compute_subnetwork" "public" {
  # Create a public subnet
  name          = "public"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  # network       = google_compute_network.vpc.id
  network       = module.vpc.network_name

  # Ensure the network is created before the subnetwork
  depends_on = [google_compute_network.vpc]
  # Ensure the project service is enabled before creating the subnetwork  
  project       = var.project_id
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "private" {
  # Create a private subnet
  name          = "private"
  ip_cidr_range = var.subnet_cidr_private
  region        = var.region

  # network       = google_compute_network.vpc.id
  network       = module.vpc.network_name
  # Ensure the network is created before the subnetwork 
  depends_on = [google_compute_network.vpc]
  # Ensure the project service is enabled before creating the subnetwork
  project       = var.project_id
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"

  
  # Create secondary IP ranges for the private subnet
  # These ranges are used for Kubernetes pods and services
  secondary_ip_range {
    range_name    = "k8s-pods"
    ip_cidr_range = var.subnet_cidr_k8s-pods
  }
  secondary_ip_range {
    range_name    = "k8s-services"
    ip_cidr_range = var.subnet_cidr_k8s-services
  }
  
}