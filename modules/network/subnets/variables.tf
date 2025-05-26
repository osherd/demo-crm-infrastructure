variable "subnet_cidr" {
  description = "The CIDR range for the public subnet"
  type        = string
  default     = ""
}
 variable "project_id" {
  description = "The ID of the project in which the subnets will be created"
  type        = string
 }
variable "region" {
  description = "The region where the subnets will be created"
  type        = string
}
variable "subnet_cidr_private" {
  description = "The CIDR range for the private subnet"
  type        = string
  default     = ""
}
variable "subnet_cidr_k8s-pods" {
  description = "The CIDR range for Kubernetes pods"
  type        = string
  default     = ""
}
variable "subnet_cidr_k8s-services" {
  description = "The CIDR range for Kubernetes services"
  type        = string
  default     = ""
}