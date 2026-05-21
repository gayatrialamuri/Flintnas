terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaksdev01"
    container_name       = "tfstate"
    key                  = "aks-centralus-dev.tfstate"
  }
}
