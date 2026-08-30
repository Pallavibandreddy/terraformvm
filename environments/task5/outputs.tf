output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "location" {
  value = var.location
}

output "app_service_name" {
  value = module.appservice.app_service_name
}

output "app_service_hostname" {
  value = module.appservice.default_hostname
}

output "managed_identity_principal_id" {
  value = module.appservice.principal_id
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "sql_database_name" {
  value = module.sql.sql_database_name
}

output "sql_server_fqdn" {
  value = module.sql.fully_qualified_domain_name
}

output "key_vault_name" {
  value = module.keyvault.key_vault_name
}