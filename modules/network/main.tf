provider "google" {
  project = var.project_id
  region  = var.region
}

# Determine the number of subnets based on var.ha and available zones in region
data "google_compute_zones" "available" {
  region = var.region
}

locals {
  min_ha = min(length(data.google_compute_zones.available.names), var.ha)
  total  = local.min_ha <= 1 ? 1 : local.min_ha
}


 #VPC and Networking Resources
 resource "google_compute_network" "this" {
  name                    = "${var.name_prefix}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_router" "this" {
  name    = "${var.name_prefix}-router"
  network = google_compute_network.this.name
  region  = var.region
}

resource "google_compute_subnetwork" "this" {
  count             = local.total
  name              = "${var.name_prefix}-subnet-${count.index}"
   ip_cidr_range =  var.ip_cidr_range 

  region            = var.region
  network           = google_compute_network.this.id
  private_ip_google_access = true
}

# Internet Access (via Cloud NAT)
resource "google_compute_router_nat" "this" {
  name                               = "${var.name_prefix}-nat"
  router                             = google_compute_router.this.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
