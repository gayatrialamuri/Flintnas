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