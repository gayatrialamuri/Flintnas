module "infra" {
  source = "./infra"

  location    = var.location
  environment = var.environment

  system_vm_size  = var.system_vm_size
  user_vm_size    = var.user_vm_size
  os_disk_type    = var.os_disk_type
  os_disk_size_gb = var.os_disk_size_gb

  vnet_cidr         = var.vnet_cidr
  aks_subnet_1_cidr = var.aks_subnet_1_cidr
  aks_subnet_2_cidr = var.aks_subnet_2_cidr
  aks_subnet_3_cidr = var.aks_subnet_3_cidr

  appgw_subnet_cidr = var.appgw_subnet_cidr

  pod_cidr       = var.pod_cidr
  service_cidr   = var.service_cidr
  dns_service_ip = var.dns_service_ip
}

module "addons" {
  source = "./addons"

  kube_host               = module.infra.kube_host
  kube_client_certificate = module.infra.kube_client_certificate
  kube_client_key         = module.infra.kube_client_key
  kube_ca                 = module.infra.kube_ca

  depends_on = [module.infra]
}