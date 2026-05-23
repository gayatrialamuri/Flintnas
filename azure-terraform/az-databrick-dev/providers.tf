terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.30"
    }
  }
}

provider "azurerm" {
  features {}
}

# Workspace-level Databricks provider
provider "databricks" {
  host  = var.databricks_host   # e.g. https://<workspace-url>.azuredatabricks.net
  token = var.databricks_token  # PAT from the workspace
}