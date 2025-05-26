locals {
  project_id = "concrete-fusion-460312-m9"
  project_name = "demo-crm"
  region     = "us-central1"
  
  apis= [
    "compute.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com"
  ]
   subnet_cidr = "10.0.1.0/24"
   subnet_cidr_private = "10.0.32.0/24"
    subnet_cidr_k8s-pods = "172.16.0.0/16"
  subnet_cidr_k8s-services = "172.20.0.0/20"
}