


resource "azurerm_route_table" "route" {
  for_each = var.routes
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  route {
    name           = each.value.routename
    address_prefix = each.value.address_prefix
    next_hop_type  = each.value.next_hop_type
    next_hop_in_ip_address = each.value.next_hop_in_ip_address
  }
}

variable "routes" {}
