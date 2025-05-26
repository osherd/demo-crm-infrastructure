module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 30.0"

  project_id         = var.project_id
  name               = var.name
  region             = var.region
  network            = var.network
  subnetwork         = var.subnetwork
  ip_range_pods      = var.ip_range_pods
  ip_range_services  = var.ip_range_services
  release_channel    = "STABLE"
  kubernetes_version = var.kubernetes_version

  enable_private_endpoint = true
  enable_private_nodes    = true
  enable_shielded_nodes   = true

  remove_default_node_pool = true
  initial_node_count       = 1

  node_pools = [
    {
      name         = "default-node-pool"
      machine_type = "standard"
      node_type   = "n2-standard"
      min_count    = 1
      max_count    = 3
      disk_size_gb = 100
      auto_upgrade = true
      auto_repair  = true
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  ]
}

resource "kubernetes_storage_class" "standard" {
  metadata {
    name = "standard"
  }

  storage_provisioner = "pd.csi.storage.gke.io"

  parameters = {
    type = "pd-balanced"
  }

  reclaim_policy        = "Delete"
  volume_binding_mode   = "WaitForFirstConsumer"
  allow_volume_expansion = true
}