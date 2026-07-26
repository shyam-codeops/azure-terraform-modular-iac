resource "azurerm_network_interface" "nics" {
  for_each = var.network_interface
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}



####For one NIC##
# data "azurerm_subnet" "subnet" {
#   name                 = "frontendsubnet"
#   virtual_network_name = "dev-network"
#   resource_group_name  = "rg_dev"
# }

# data "azurerm_public_ip" "public_ip" {
#   name                = "frontend-public-ip"
#   resource_group_name = "rg_dev"
# }



# resource "azurerm_network_interface" "example" {
#   name                = "frontend-nic"
#   location            = "centralindia"
#   resource_group_name = "rg_dev"

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.subnet.id
#     public_ip_address_id          = data.azurerm_public_ip.public_ip.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }





