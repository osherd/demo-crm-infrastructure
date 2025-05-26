provider "google" {
  project = local.project_id
  region  = local.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  required_version = ">= 0.12"
}