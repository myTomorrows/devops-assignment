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


resource "helm_release" "flask_app" {
  name      = "my-flask-app"
  chart     = "./helm" # Path to the Helm chart
  namespace = "default"
  wait      = true

  set {
    name  = "replicaCount"
    value = 2
  }

  set {
    name  = "image.repository"
    value = "<your-dockerhub-username>/my-flask-app"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }
}

module "network" {
  source = "./modules/network"

  environment         = var.environment
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["eu-west-1a", "eu-west-1b"]
}

module "eks" {
  source      = "./modules/eks"
  environment = var.environment
  subnet_ids  = module.network.public_subnet_ids

  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size
}
