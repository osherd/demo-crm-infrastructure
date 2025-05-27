# outputs cluster information and network details
output "cluster_name" {
  value = module.gke.name
}
output "cluster_id" {
  value = module.gke.cluster_id
}


#output vpc and network details
output "vpc_id" {
  value = module.network.vpc_id
}
output "subnet_ids" {
  value = module.network.subnet_ids
}
output "region" {
  value = var.region
}
output "project_id" {
  value = var.project_id
}

output "app_name" {
  value = var.common_tags.app_name  

}
output "owner" {
  value = var.common_tags.owner
}
