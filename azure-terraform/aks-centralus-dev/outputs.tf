output "aks_name" {
  description = "AKS cluster name"
  value       = module.infra.aks_name
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.infra.resource_group_name
}