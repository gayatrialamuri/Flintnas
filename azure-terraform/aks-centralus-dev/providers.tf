terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.29"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc = true
}

provider "kubernetes" {
  host                   = module.infra.kube_host
  client_certificate     = base64decode(module.infra.kube_client_certificate)
  client_key             = base64decode(module.infra.kube_client_key)
  cluster_ca_certificate = base64decode(module.infra.kube_ca)
}

provider "helm" {
  kubernetes {
    host                   = module.infra.kube_host
    client_certificate     = base64decode(module.infra.kube_client_certificate)
    client_key             = base64decode(module.infra.kube_client_key)
    cluster_ca_certificate = base64decode(module.infra.kube_ca)
  }
}