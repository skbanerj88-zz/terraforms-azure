resource "azurerm_network_security_group" "Security_Group" {
  name                = "SecurityGroup_${local.environment}"
  location            = "${azurerm_resource_group.ResourceGroup.location}"
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
}

resource "azurerm_virtual_network" "VPN" {
  name                = "VirtualNetwork_${local.environment}"
  location            = "${azurerm_resource_group.ResourceGroup.location}"
  resource_group_name = "${azurerm_resource_group.ResourceGroup.name}"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "${tostring(element(split(",", module.variables.addresses[0]),0))}"
	security_group = "${azurerm_network_security_group.Security_Group.id}"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "${tostring(element(split(",", module.variables.addresses[0]),1))}"
	security_group = "${azurerm_network_security_group.Security_Group.id}"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "${tostring(element(split(",", module.variables.addresses[0]),2))}"
    security_group = "${azurerm_network_security_group.Security_Group.id}"
  }

  tags = {
    environment = "${local.environment}"
  }
}
