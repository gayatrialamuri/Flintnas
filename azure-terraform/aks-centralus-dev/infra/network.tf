resource "random_pet" "suffix" {
  length = 2
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.base_name}-rg-${random_pet.suffix.id}"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.base_name}-vnet"
  address_space       = [local.network.vnet_cidr]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnet 1 - system pool
resource "azurerm_subnet" "aks_subnet_1" {
  name                 = "${local.base_name}-subnet-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.network.aks_subnet_1_cidr]
}

# Subnet 2 - user pool
resource "azurerm_subnet" "aks_subnet_2" {
  name                 = "${local.base_name}-subnet-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.network.aks_subnet_2_cidr]
}

# Subnet 3 - user pool
resource "azurerm_subnet" "aks_subnet_3" {
  name                 = "${local.base_name}-subnet-3"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.network.aks_subnet_3_cidr]
}

# Application Gateway subnet
resource "azurerm_subnet" "appgw_subnet" {
  name                 = "snet-appgw"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.network.appgw_subnet_cidr]
}