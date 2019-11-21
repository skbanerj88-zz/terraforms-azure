terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "skbanerj88tf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
