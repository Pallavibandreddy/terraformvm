resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type  = var.os_type
  sku_name = var.sku_name
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id = azurerm_service_plan.this.id

  virtual_network_subnet_id = var.app_subnet_id

  identity {
    type = var.identity_type
  }

  site_config {
    always_on = var.always_on

    app_command_line = var.app_command_line

    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = {
    SQL_SERVER                     = var.sql_server
    SQL_DATABASE                   = var.sql_database
    KEY_VAULT_URL                  = var.key_vault_url
    APPINSIGHTS_INSTRUMENTATIONKEY = "@Microsoft.KeyVault(SecretUri=${var.app_insights_instrumentation_key_secret_uri})"
    SCM_DO_BUILD_DURING_DEPLOYMENT = var.scm_do_build_during_deployment
    ENABLE_ORYX_BUILD              = var.enable_oryx_build
  }
}

resource "azurerm_role_assignment" "key_vault_secrets_user" {
  scope                = var.key_vault_id
  role_definition_name = var.key_vault_role
  principal_id         = azurerm_linux_web_app.this.identity[0].principal_id
}