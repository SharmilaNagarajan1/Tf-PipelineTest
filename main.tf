provider "azurerm" {
  features {}

      resource_provider_registrations = "none"
      client_id          = "2eaf4b0b-e287-445d-ae0f-1da2e3ea808e"
      client_secret       = "Kof8Q~hHpfkAbXXo~EXPaYzd9uzP3uoeZlp5hdb8"
      subscription_id     ="a2b28c85-1948-4263-90ca-bade2bac4df4"
      tenant_id           ="30fe8ff1-adc6-444d-ba94-1238894df42c"

}

data "azurerm_resource_group" "rg" {
  name     = "kml_rg_main-f5fc139ce6224d3a"
  
}

resource "azurerm_storage_account" "stacc" {
  name                     = "azurepipelinestacc"
  resource_group_name      = data.azurerm_resource_group.rg.name  
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
