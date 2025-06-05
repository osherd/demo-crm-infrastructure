variable "project_id" {
  type = string
  default = "concrete-fusion-460312-m9"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "name_prefix" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "ha" {
  type    = number
  default = 3
}

variable "ip_cidr_range" {
  type        = string
  default     = "10.0.2.0/24"
}
