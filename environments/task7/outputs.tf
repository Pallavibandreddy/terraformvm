output "key_vault_name" {
  description = "Task 7 Azure Key Vault name"
  value       = azurerm_key_vault.task7.name
}

output "key_vault_id" {
  description = "Task 7 Azure Key Vault resource ID"
  value       = azurerm_key_vault.task7.id
}

output "key_vault_uri" {
  description = "Task 7 Azure Key Vault URI"
  value       = azurerm_key_vault.task7.vault_uri
}

output "app_version_secret_name" {
  description = "Name of the application version secret"
  value       = azurerm_key_vault_secret.app_version.name
}

output "resource_group_name" {
  description = "Resource group containing the Task 7 Key Vault"
  value       = data.azurerm_resource_group.task6.name
}