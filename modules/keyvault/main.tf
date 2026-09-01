data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = var.sku_name

  rbac_authorization_enabled = var.rbac_authorization_enabled

  public_network_access_enabled = var.public_network_access_enabled

  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
}

resource "azurerm_private_dns_zone" "this" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "${var.key_vault_name}-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name

  virtual_network_id = var.virtual_network_id
}

resource "azurerm_private_endpoint" "this" {
  name                = "${var.key_vault_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.key_vault_name}-private-connection"
    private_connection_resource_id = azurerm_key_vault.this.id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresource_names
  }

  private_dns_zone_group {
    name = var.private_dns_zone_group_name

    private_dns_zone_ids = [
      azurerm_private_dns_zone.this.id
    ]
  }
}

resource "azurerm_key_vault_secret" "appinsights_instrumentation_key" {
  name         = "appinsights-instrumentation-key"
  value        = var.app_insights_instrumentation_key
  key_vault_id = azurerm_key_vault.this.id
}