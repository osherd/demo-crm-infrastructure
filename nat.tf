# Create a static external IP address for the NAT gateway
# This address will be used by the NAT gateway to access the internet
resource "google_compute_address" "nat" {
  name         = "nat"
  region       = local.region
  address_type = "EXTERNAL"
  project      = local.project_id
  network_tier = "STANDARD"
  depends_on = [ google_project_service.api ]
}

resource "google_compute_router" "router" {
  name    = "router"
  region  = local.region
  network = google_compute_network.vpc.id
  project = local.project_id
  }

resource "google_compute_router_nat" "nat" {
  name   = "nat"
  region = local.region
  router = google_compute_router.router.name
  project = local.project_id


  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips               = [google_compute_address.nat.self_link]

  # Configure the NAT gateway to use the private subnet
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name     = google_compute_subnetwork.private.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}