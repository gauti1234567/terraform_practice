resource "azurerm_network_interface" "nics" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
    
  }
}

variable "nics" {}

data "azurerm_subnet" "subnet_data" {
  for_each             = var.nics
  name                 = each.value.subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

