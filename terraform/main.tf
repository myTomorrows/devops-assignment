terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Adjust the version as needed
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0" # Adjust the version as needed
    }
  }

  required_version = ">= 1.0.0" # Adjust the Terraform version as needed
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


resource "helm_release" "mt_app" {
  name      = "mt-app"
  chart     = "../helm/mt-app"
  namespace = "default"
  wait      = true

}

module "network" {
  source = "./modules/network"

  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "eks" {
  source      = "./modules/eks"
  environment = var.environment
  subnet_ids  = module.network.public_subnet_ids

  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size
}
