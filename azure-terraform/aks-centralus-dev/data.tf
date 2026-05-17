data "azurerm_resources" "agic_identities" {
  type                = "Microsoft.ManagedIdentity/userAssignedIdentities"
  resource_group_name = "MC_${azurerm_resource_group.rg.name}_${azurerm_kubernetes_cluster.aks.name}_${azurerm_resource_group.rg.location}"
}