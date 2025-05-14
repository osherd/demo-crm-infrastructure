terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "demo-crm-task" # REPLACE WITH YOUR BUCKET NAME
    key            = "terraform_modules/terraform.tfstate"
    region         = "ap-south-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region

  default_tags {
    tags = var.common_tags
  }
}
