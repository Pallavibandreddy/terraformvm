resource "azurerm_mssql_server" "this" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  version = "12.0"

  azuread_administrator {
    login_username              = var.administrator_login
    object_id                   = var.administrator_object_id
    azuread_authentication_only = true
  }

  public_network_access_enabled = true
}

resource "azurerm_mssql_database" "this" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.this.id

  sku_name = "Basic"
}