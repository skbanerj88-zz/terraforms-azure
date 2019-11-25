resource "azurerm_network_security_group" "Security_Group" {
  name                = "SecurityGroup_${local.environment}"
  location            = "azurerm_resource_group.ResourceGroup.location"
  resource_group_name = "azurerm_resource_group.ResourceGroup.name"
}

resource "azurerm_virtual_network" "VPN" {
  name                = "VirtualNetwork_${local.environment}"
  location            = "azurerm_resource_group.ResourceGroup.location"
  resource_group_name = "azurerm_resource_group.ResourceGroup.name"
  address_space       = "module.variables.address_spaces[0]"
  dns_servers         = "module.variables.dns_servers[0]"

  subnet {
    name           = "subnet1"
    address_prefix = "tostring(element(split(",", module.variables.addresses[0]),0))"
	  security_group = "azurerm_network_security_group.Security_Group.id"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "tostring(element(split(",", module.variables.addresses[0]),1))"
	  security_group = "azurerm_network_security_group.Security_Group.id"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "tostring(element(split(",", module.variables.addresses[0]),2))"
    security_group = "azurerm_network_security_group.Security_Group.id"
  }

  tags = {
    environment = "${local.environment}"
  }
}
