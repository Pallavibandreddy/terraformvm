output "resource_group_name" {
  description = "Task 6 Resource Group name"
  value       = azurerm_resource_group.task6.name
}

output "app_service_plan_name" {
  description = "Task 6 App Service Plan name"
  value       = azurerm_service_plan.task6.name
}

output "api_app_name" {
  description = "Task 6 API App Service name"
  value       = azurerm_linux_web_app.api.name
}

output "api_url" {
  description = "Task 6 API URL"
  value       = "https://${azurerm_linux_web_app.api.default_hostname}"
}

output "ui_app_name" {
  description = "Task 6 UI App Service name"
  value       = azurerm_linux_web_app.ui.name
}

output "ui_url" {
  description = "Task 6 UI URL"
  value       = "https://${azurerm_linux_web_app.ui.default_hostname}"
}