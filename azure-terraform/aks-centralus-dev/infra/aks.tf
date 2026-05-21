# Log Analytics workspace for AKS monitoring
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${local.base_name}-law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.base_name}-cluster-${random_pet.suffix.id}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${local.base_name}-dns"
  oidc_issuer_enabled = true
  kubernetes_version  = null

  default_node_pool {
    name                         = "system"
    vm_size                      = var.system_vm_size
    vnet_subnet_id               = azurerm_subnet.aks_subnet_1.id
    type                         = "VirtualMachineScaleSets"
    only_critical_addons_enabled = true

    os_disk_type     = var.os_disk_type
    os_disk_size_gb  = var.os_disk_size_gb
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin       = "azure"
    network_data_plane   = "cilium"
    network_policy       = "cilium"
    network_plugin_mode  = "overlay"
    service_cidr         = "10.1.0.0/16"
    dns_service_ip       = "10.1.0.10"
    pod_cidr             = "10.2.0.0/16"
  }

  azure_policy_enabled = true

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  }

  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.appgw.id
  }

  role_based_access_control_enabled = true

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}


# User node pool in subnet 1
resource "azurerm_kubernetes_cluster_node_pool" "userpool1" {
  name                  = "user1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_vm_size
  vnet_subnet_id        = azurerm_subnet.aks_subnet_1.id
  mode                  = "User"

  os_disk_type        = var.os_disk_type
  os_disk_size_gb     = var.os_disk_size_gb

  enable_auto_scaling = true
  min_count           = 1
  max_count           = 1

  tags = {
    environment = var.environment
    pool        = "user1"
  }
}

# # User node pool in subnet 2
# resource "azurerm_kubernetes_cluster_node_pool" "userpool2" {
#   name                  = "user2"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
#   vm_size               = var.user_vm_size
#   vnet_subnet_id        = azurerm_subnet.aks_subnet_2.id
#   mode                  = "User"

#   os_disk_type        = var.os_disk_type
#   os_disk_size_gb     = var.os_disk_size_gb

#   enable_auto_scaling = true
#   min_count           = 1
#   max_count           = 1

#   tags = {
#     environment = var.environment
#     pool        = "user2"
#   }
# }

# # User node pool in subnet 3
# resource "azurerm_kubernetes_cluster_node_pool" "userpool3" {
#   name                  = "user3"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
#   vm_size               = var.user_vm_size
#   vnet_subnet_id        = azurerm_subnet.aks_subnet_3.id
#   mode                  = "User"

#   os_disk_type        = var.os_disk_type
#   os_disk_size_gb     = var.os_disk_size_gb

#   enable_auto_scaling = true
#   min_count           = 1
#   max_count           = 1

#   tags = {
#     environment = var.environment
#     pool        = "user3"
#   }
# }