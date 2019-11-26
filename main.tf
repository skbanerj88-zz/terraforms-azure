# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  # version = "=1.36.0"
	subscription_id = "f7906067-76af-4a3d-b986-298e0f27df8a"
}

locals {
	environment = "${lookup(var.workspace_to_environment_map, terraform.workspace, "dev")}"
	size        = "${local.environment == "dev" ? lookup(var.workspace_to_size_map, terraform.workspace, "small") : var.environment_to_size_map[local.environment]}"
	location    = "West US"
}

module "variables" {
	source = "git::https://github.com/skbanerj88/terraforms-azure//variables"

	environment = "${local.environment}"
	size        = "${local.size}"
}
