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

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }

  required_version = ">= 1.0.0" # Adjust the Terraform version as needed
}

resource "random_string" "API_BASE_URL" {
  length  = 8
  special = false
  upper   = false
}

resource "random_password" "DB_PASSWORD" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>?"
}

resource "random_password" "SECRET_KEY" {
  length           = 64
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>?"
}

resource "random_shuffle" "LOG_LEVEL" {
  input        = ["DEBUG", "INFO", "WARNING", "ERROR"]
  result_count = 1
}

resource "random_integer" "MAX_CONNECTIONS" {
  min = 10000
  max = 50000
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "mt_app" {
  name      = "mt-app"
  chart     = "../helm/mt-app"
  namespace = "default"
  wait      = true
  version   = var.app_version

  set {
    name  = "secrets.apiBaseUrl"
    value = "api-${random_string.API_BASE_URL.result}.mt-challenge.com"
  }

  set {
    name  = "secrets.dbPassword"
    value = random_password.DB_PASSWORD.result
  }

  set {
    name  = "secrets.logLevel"
    value = random_shuffle.LOG_LEVEL.result[0]
  }

  set {
    name  = "secrets.maxConnections"
    value = tostring(random_integer.MAX_CONNECTIONS.result)
  }

  set {
    name  = "secrets.secretKey"
    value = random_password.SECRET_KEY.result
  }
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
