terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = ">=2.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-1"
  location = "westeurope"
}

resource "azurerm_data_factory" "adf" {
  name                = var.adfname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
