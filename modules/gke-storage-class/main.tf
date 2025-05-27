provider "kubernetes" {
  alias                  = "custom"
  host                   = var.host
  token                  = var.token
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

resource "kubernetes_storage_class_v1" "default_pd_balanced" {
  provider = kubernetes.custom

  metadata {
    name = "pd-balanced-csi"

    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }

  storage_provisioner    = "pd.csi.storage.gke.io"
  allow_volume_expansion = true
  reclaim_policy         = "Delete"
  volume_binding_mode    = "WaitForFirstConsumer"

  parameters = {
    type                        = "pd-balanced"
    "csi.storage.k8s.io/fstype" = "ext4"
  }
}
