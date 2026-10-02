rgs = {
  rg1 = {
    name     = "rg-26"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-26"
    location            = "centralindia"
    resource_group_name = "rg-26"
    address_space       = ["10.0.0.0/16"]

  }
  vnet2 = {
    name                = "vnet-269"
    location            = "centralindia"
    resource_group_name = "rg-26"
    address_space       = ["10.1.0.0/16"]

  }
}

subnets = {
  subnet1 = {
    name                 = "subnet26"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-26"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-26"
    address_prefixes     = ["10.0.2.0/26"]
  }

  subnet3 = {
    name                 = "keyvaultsubnet"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-26"
    address_prefixes     = ["10.0.3.0/26"]
  }

  subnet4 = {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-26"
    address_prefixes     = ["10.0.4.0/26"]
  }
}

pips = {
  pip1 = {
    name                = "publicip26"
    resource_group_name = "rg-26"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "publicip261"
    resource_group_name = "rg-26"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "publicip262"
    resource_group_name = "rg-26"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

nsgs = {
  ngg1 = {
    name                = "nsg1"
    location            = "centralindia"
    resource_group_name = "rg-26"

  }
}
nics = {

  nic1 = {
    name                 = "nic26"
    location             = "centralindia"
    resource_group_name  = "rg-26"
    subnet               = "subnet26"
    virtual_network_name = "vnet-26"

  }
}

vms = {
  vm1 = {

    name                = "linuxmachine"
    resource_group_name = "rg-26"
    location            = "centralindia"
    size                = "Standard_D4_v5"
    admin_username      = "azureuser"
    admin_password      = "azureuser@098"
    nic_name            = "nic26"
  }
}

load_balancers = {
  load_balancer1 = {
    name                = "loadbalancer26"
    location            = "centralindia"
    resource_group_name = "rg-26"
    pip_name            = "publicip261"

  }
}
bastions = {
  bastion = {
    name                 = "azurebastion"
    location             = "centralindia"
    resource_group_name  = "rg-26"
    public_ip            = "publicip262"
    subnet               = "AzureBastionSubnet"
    virtual_network_name = "vnet-26"
  }
}

routes = {
  route1 = {
    name                   = "routetable"
    location               = "centralindia"
    resource_group_name    = "rg-26"
    routename              = "route1"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.0.2.4"

  }
}

peering = {
  peering1 = {

    name                 = "vnet1tovnet2"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-26"
    vnet                 = "vnet-269"
  }

  peering2 = {

    name                 = "vnet2tovnet1"
    resource_group_name  = "rg-26"
    virtual_network_name = "vnet-269"
    vnet                 = "vnet-26"
  }
}

key_vault = {
  key_vault1 = {
    name                = "keyvault827380"
    location            = "centralindia"
    resource_group_name = "rg-26"

  }
}

postgresql = {
  postgresql1 = {

    server_name            = "postgresqldatabase"
    resource_group_name    = "rg-26"
    location               = "centralindia"
    administrator_login    = "adminuser"
    administrator_password = "adminuser@098"
    database_name          = "postgrsdb"


  }
}

private_endpoint = {
  pe1 = {
    name                 = "privateendpoint"
    location             = "centralindia"
    resource_group_name  = "rg-26"
    private_connection   = "keyvault_connection"
    key_vault            = "keyvault827380"
    subnet               = "keyvaultsubnet"
    virtual_network_name = "vnet-26"

  }
}

storage = {
  storage1 = {

    name                     = "storage827380"
    resource_group_name      = "rg-26"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
container = {
  container1 = {
    name                  = "contaiertf"
    container_access_type = "private"
    storage               = "storage827380"
    resource_group_name   = "rg-26"
  }
}

blob = {
  blob1 = {
    blob_name           = "blobs26"
    type                = "Block"
    source              = "D:/Gautam Folder/ADO-Pipeline/Terraform_practice/some-local-file.zip"
    storage             = "storage827380"
    resource_group_name = "rg-26"
    container           = "contaiertf"
  }
}

firewall = {
  firewall1 ={
  name                = "azurefirewall"
  location            = "centralindia"
  resource_group_name = "rg-26"
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  ip_configuration    = "configuration"
  subnet              = "AzureFirewallSubnet"
  virtual_network_name= "vnet-26"
  public_ip           = "publicip26"

  }
}
