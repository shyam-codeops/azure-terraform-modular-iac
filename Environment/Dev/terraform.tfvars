rgs = {
  rg1 = {
    name     = "rg_dev"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "dev-network"
    location            = "centralindia"
    resource_group_name = "rg_dev"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontendsubnet"
    resource_group_name  = "rg_dev"
    virtual_network_name = "dev-network"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsubnet"
    resource_group_name  = "rg_dev"
    virtual_network_name = "dev-network"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "frontend-public-ip"
    resource_group_name = "rg_dev"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-public-ip"
    resource_group_name = "rg_dev"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}


network_interface = {
  nic1 = {
    nic_name             = "frontend-nic"
    location             = "centralindia"
    resource_group_name  = "rg_dev"
    subnet_name          = "frontendsubnet"
    virtual_network_name = "dev-network"
    public_ip_name       = "frontend-public-ip"
  }
  nic2 = {
    nic_name             = "backend-nic"
    location             = "centralindia"
    resource_group_name  = "rg_dev"
    subnet_name          = "backendsubnet"
    virtual_network_name = "dev-network"
    public_ip_name       = "backend-public-ip"
  }
}


virtual_machines = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg_dev"
    location            = "centralindia"
    size                = "Standard_D2s_v3"
    admin_username      = "ssadmin"
    admin_password      = "Nested@1234"
    nic_name            = "frontend-nic"
  }
  vm2 = {
    name                = "backend-vm"
    resource_group_name = "rg_dev"
    location            = "centralindia"
    size                = "Standard_D2s_v3"
    admin_username      = "ssadmin"
    admin_password      = "Nested@1234"
    nic_name            = "backend-nic"
  }
}

