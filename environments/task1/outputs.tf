output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vm_name" {
  value = module.vm.vm_name
}

output "public_ip_address" {
  value = module.network.public_ip_address
}

output "vnet_id" {
  value = module.network.vnet_id
}