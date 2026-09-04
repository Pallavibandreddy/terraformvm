provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

# --------------------------------------------------
# Existing Task 6 Resource Group
# --------------------------------------------------

data "azurerm_resource_group" "task6" {
  name = var.resource_group_name
}

# --------------------------------------------------
# Task 7 Azure Key Vault
# --------------------------------------------------

resource "azurerm_key_vault" "task7" {
  name                = var.key_vault_name
  location            = data.azurerm_resource_group.task6.location
  resource_group_name = data.azurerm_resource_group.task6.name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  rbac_authorization_enabled = true

  purge_protection_enabled = false

  soft_delete_retention_days = 7

  tags = {
    Project = "Task7"
    Purpose = "Application Version Management"
  }
}

# --------------------------------------------------
# Initial Application Version
# --------------------------------------------------

resource "azurerm_key_vault_secret" "app_version" {
  name         = "app-version"
  value        = var.initial_version
  key_vault_id = azurerm_key_vault.task7.id

  depends_on = [
    azurerm_key_vault.task7
  ]
}