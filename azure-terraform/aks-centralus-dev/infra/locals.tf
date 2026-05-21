locals {
  # AGIC identity (safe indexing)
  agic_client_id  = try(azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].client_id, null)
  agic_object_id  = try(azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id, null)
  agic_uami_id    = try(azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].user_assigned_identity_id, null)

  # Naming + environment
  base_name   = "aks-${var.environment}"
  location    = var.location
  environment = var.environment

  # Node pool settings
  system_vm_size  = var.system_vm_size
  user_vm_size    = var.user_vm_size
  os_disk_type    = var.os_disk_type
  os_disk_size_gb = var.os_disk_size_gb

  # Networking
  network = {
    vnet_cidr          = var.vnet_cidr
    aks_subnet_1_cidr  = var.aks_subnet_1_cidr
    aks_subnet_2_cidr  = var.aks_subnet_2_cidr
    aks_subnet_3_cidr  = var.aks_subnet_3_cidr
    appgw_subnet_cidr  = var.appgw_subnet_cidr
    pod_cidr           = var.pod_cidr
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
  }
}