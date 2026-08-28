output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_id" {
  value = azurerm_subnet.this.id
}

output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.this :
    key => nic.id
  }
}

output "public_ip_addresses" {
  value = {
    for key, ip in azurerm_public_ip.this :
    key => ip.ip_address
  }
}

output "public_ip_ids" {
  value = {
    for key, ip in azurerm_public_ip.this :
    key => ip.id
  }
}