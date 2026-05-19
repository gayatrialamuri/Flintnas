module "infra" {
  source = "./infra"
}

module "addons" {
  source = "./addons"

  kube_host               = module.infra.kube_host
  kube_client_certificate = module.infra.kube_client_certificate
  kube_client_key         = module.infra.kube_client_key
  kube_ca                 = module.infra.kube_ca

  depends_on = [ module.infra ]
}