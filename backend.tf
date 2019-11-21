terraform {
  backend "azurerm" {
    resource_group_name  = "dev"
    storage_account_name = "devskbanerj88"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
