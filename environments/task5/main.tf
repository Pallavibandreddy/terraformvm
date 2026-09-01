module "resource_group" {
  source = "../../modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "../../modules/net"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix

  private_endpoint_subnet_name           = var.private_endpoint_subnet_name
  private_endpoint_subnet_address_prefix = var.private_endpoint_subnet_address_prefix

  nsg_name   = var.nsg_name
  nic_config = var.nic_config

  enable_app_service_delegation = var.enable_app_service_delegation
  security_rules                = var.security_rules
}

module "keyvault" {
  source = "../../modules/keyvault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  subnet_id          = module.network.private_endpoint_subnet_id
  virtual_network_id = module.network.vnet_id

  sku_name                      = var.key_vault_sku
  rbac_authorization_enabled    = var.key_vault_rbac_enabled
  public_network_access_enabled = var.key_vault_public_network_access_enabled
  purge_protection_enabled      = var.key_vault_purge_protection_enabled
  soft_delete_retention_days    = var.key_vault_soft_delete_retention_days

  private_dns_zone_name       = var.key_vault_private_dns_zone_name
  is_manual_connection        = var.key_vault_private_endpoint_manual
  subresource_names           = var.key_vault_subresource_names
  private_dns_zone_group_name = var.key_vault_dns_zone_group_name

  app_insights_instrumentation_key = module.app_insights.instrumentation_key
}

module "appservice" {
  source = "../../modules/appservice"

  app_service_name      = var.app_service_name
  app_service_plan_name = var.app_service_plan_name

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  sku_name      = var.app_service_sku
  app_subnet_id = module.network.subnet_id
  key_vault_id  = module.keyvault.key_vault_id

  sql_server   = module.sql.fully_qualified_domain_name
  sql_database = module.sql.sql_database_name

  key_vault_url = module.keyvault.key_vault_uri

  app_insights_instrumentation_key_secret_uri = module.keyvault.app_insights_instrumentation_key_secret_uri

  os_type                        = var.os_type
  identity_type                  = var.identity_type
  always_on                      = var.always_on
  app_command_line               = var.app_command_line
  node_version                   = var.node_version
  scm_do_build_during_deployment = var.scm_do_build_during_deployment
  enable_oryx_build              = var.enable_oryx_build
  key_vault_role                 = var.key_vault_role
}

module "sql" {
  source = "../../modules/sql"

  sql_server_name   = var.sql_server_name
  sql_database_name = var.sql_database_name

  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  administrator_login     = var.sql_administrator_login
  administrator_object_id = var.sql_administrator_object_id

  app_service_principal_id      = module.appservice.principal_id
  sql_server_version            = var.sql_server_version
  azuread_authentication_only   = var.azuread_authentication_only
  public_network_access_enabled = var.sql_public_network_access_enabled
  sql_database_sku              = var.sql_database_sku
}

module "app_insights" {
  source = "../../modules/appinsights"

  application_insights_name    = var.application_insights_name
  log_analytics_name           = var.log_analytics_name
  location                     = var.app_insights_location
  resource_group_name          = module.resource_group.resource_group_name
  log_analytics_sku            = var.log_analytics_sku
  log_analytics_retention_days = var.log_analytics_retention_days
  application_type             = var.application_type
}