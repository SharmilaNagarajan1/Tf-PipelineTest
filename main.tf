provider "azurerm" {
  features {}

      resource_provider_registrations = "none"
      client_id           = "4c23435d-d065-45ab-89fb-0d020e46c687"
      client_secret       = "4c23435d-d065-45ab-89fb-0d020e46c687"
      subscription_id     ="a2b28c85-1948-4263-90ca-bade2bac4df4"
      tenant_id           ="30fe8ff1-adc6-444d-ba94-1238894df42c"

}

data "azurerm_resource_group" "rg" {
  name     = "kml_rg_main-f43452212c28433d"
  
}

resource "azurerm_storage_account" "stacc" {
  name                     = "azurepipelinestacc"
  resource_group_name      = data.azurerm_resource_group.rg.name  
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
