terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "helm" {
  kubernetes {
    host                   = module.wanderlust_eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.wanderlust_eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.wanderlust_eks.cluster_name]
    }
  }
}

provider "kubectl" {
  host                   = module.wanderlust_eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.wanderlust_eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.wanderlust_eks.cluster_name]
  }
}
