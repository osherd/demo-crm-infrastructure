locals {
  name_prefix = "${var.common_tags.owner}-${var.common_tags.app_name}"
}

module "network" {
  source             = "./modules/network"
  project_id         = var.project_id
  region             = var.region
  vpc_cidr           = var.vpc_cidrs
  ha                = var.ha
  name_prefix        = local.name_prefix
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 30.0"

  project_id        = var.project_id
  name              = "${var.common_tags.owner}-gke-cluster"
  region            = var.region
  kubernetes_version = var.cluster_version

  network           = module.network.vpc_id

  subnetwork        = module.network.subnet_ids[0] # Use the first subnet created by the network module

  ip_range_pods     = "k8s-pods"
  ip_range_services = "k8s-services"

  remove_default_node_pool = true
  initial_node_count       = 1

  node_pools = [
    {
      name         = "${var.common_tags.owner}-gke-node"
      machine_type = var.node_type
      min_count    = 1
      max_count    = 1
      auto_upgrade = true
      auto_repair  = true
      preemptible  = false
    }
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}


provider "helm" {
  kubernetes {
    host                   = module.gke.endpoint
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
