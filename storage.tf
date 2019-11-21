resource "azurerm_storage_account" "Storage_Account" {
  name                     = "${local.environment}skbanerj88"
  resource_group_name      = "${azurerm_resource_group.ResourceGroup.name}"
  location                 = "${azurerm_resource_group.ResourceGroup.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "${local.environment}"
  }
}

resource "azurerm_storage_container" "Storage_Container" {
  name                  = "tfstate"
  storage_account_name  = "${azurerm_storage_account.Storage_Account.name}"
  container_access_type = "private"
}