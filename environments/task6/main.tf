terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# --------------------------------------------------
# Resource Group
# --------------------------------------------------

resource "azurerm_resource_group" "task6" {
  name     = var.resource_group_name
  location = var.location
}

# --------------------------------------------------
# App Service Plan
# --------------------------------------------------

resource "azurerm_service_plan" "task6" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.task6.name
  location            = azurerm_resource_group.task6.location

  os_type  = "Linux"
  sku_name = "B1"
}

# --------------------------------------------------
# API App Service
# --------------------------------------------------

resource "azurerm_linux_web_app" "api" {
  name                = var.api_app_name
  resource_group_name = azurerm_resource_group.task6.name
  location            = azurerm_resource_group.task6.location

  service_plan_id = azurerm_service_plan.task6.id

  site_config {
    always_on = true

    app_command_line = "node server.js"

    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = var.node_version
  }
}

# --------------------------------------------------
# UI App Service
# --------------------------------------------------

resource "azurerm_linux_web_app" "ui" {
  name                = var.ui_app_name
  resource_group_name = azurerm_resource_group.task6.name
  location            = azurerm_resource_group.task6.location

  service_plan_id = azurerm_service_plan.task6.id

  site_config {
    always_on = true

    app_command_line = "npx serve -s dist -l 8080"

    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = var.node_version
  }
}