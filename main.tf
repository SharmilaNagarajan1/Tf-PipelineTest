provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name     = "kml_rg_main-f5fc139ce6224d3a"
  
}

resource "azurerm_storage_account" "stacc" {
  name                     = "azurepipelineGithubAc"
  resource_group_name      = data.azurerm_resource_group.rg.name  
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
