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
    pip_name             = "publicip26"
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



