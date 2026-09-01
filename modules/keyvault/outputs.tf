output "key_vault_id" {
  description = "Key Vault resource ID"
  value       = azurerm_key_vault.this.id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.this.name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.this.vault_uri
}

output "private_endpoint_id" {
  description = "Key Vault private endpoint ID"
  value       = azurerm_private_endpoint.this.id
}

output "app_insights_instrumentation_key_secret_uri" {
  description = "Versionless URI of the Application Insights instrumentation key secret"
  value       = azurerm_key_vault_secret.appinsights_instrumentation_key.versionless_id
}