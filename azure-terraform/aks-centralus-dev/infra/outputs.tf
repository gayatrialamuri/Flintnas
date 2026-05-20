output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "agic_enabled" {
  description = "Indicates whether AGIC addon is enabled on the AKS cluster"
  value       = length(azurerm_kubernetes_cluster.aks.ingress_application_gateway) > 0
}

output "agic_gateway_id" {
  description = "Application Gateway ID used by AGIC addon"
  value       = azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].gateway_id
}

output "agic_identity_client_id" {
  description = "Client ID of the AKS AGIC addon identity"
  value       = local.agic_client_id
}

output "kube_host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "kube_client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "kube_client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "kube_ca" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}
