terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.16.1"
    }
  }
  backend "s3" {
    bucket = "terraform-state-ax21"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.lt_eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.lt_eks_cluster.certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.lt_eks_cluster.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.lt_eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.lt_eks_cluster.certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.lt_eks_cluster.cluster_name]
      command     = "aws"
    }
  }
}
