output "resource_group_name" {
  value = module.rg.resource_group_name
}

output "vnet_id" {
  value = module.net.vnet_id
}

output "subnet_id" {
  value = module.net.subnet_id
}

output "vm_names" {
  value = [
    for vm in module.vm : vm.vm_name
  ]
}

output "vm_ids" {
  value = [
    for vm in module.vm : vm.vm_id
  ]
}

output "nic_ids" {
  value = module.net.nic_ids
}

output "public_ip_addresses" {
  value = module.net.public_ip_addresses
}