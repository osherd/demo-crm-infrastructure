# General
common_tags = {
    owner           = "osher"
    managedBy       = "terraform"
    usage           = "training"
    app_name        = "demo-crm"
}
region = "ap-south-1"

# Network
vpc_cidrs          = "10.0.0.0/16"
ha                 = 2

# EKS
cluster_version    = "1.28"
node_type          = "t3a.large"