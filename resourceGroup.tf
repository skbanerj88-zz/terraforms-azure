# Create a resource group
resource "azurerm_resource_group" "ResourceGroup" {
  name     = "local.environment"
  location = "local.location"
}
