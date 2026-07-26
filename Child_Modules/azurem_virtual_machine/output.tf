output "network_interface_id" {
  value = { for k, v in data.azurerm_network_interface.nics : k => v.id }
}