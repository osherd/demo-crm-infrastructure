resource "google_compute_network" "vpc" {
  name                    = var.name
  project                 = var.project_id
  auto_create_subnetworks = false
    delete_default_routes_on_create = true
  routing_mode            = "REGIONAL"
  depends_on = [ google_project_service.api ]
}

#Remove this route to make the VPC fully private
# you need this route for the NAT gateway.
resource "google_compute_route" "default-route" {
  name        = "default-route"
  network     = google_compute_network.vpc.name
  dest_range  = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  }

resource "google_project_service" "api" {
  for_each = toset([
    "compute.googleapis.com"
  ])
  service = each.key
}


