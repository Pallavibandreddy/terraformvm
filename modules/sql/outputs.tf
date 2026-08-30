output "sql_server_id" {
  description = "SQL Server resource ID"
  value       = azurerm_mssql_server.this.id
}

output "sql_server_name" {
  description = "SQL Server name"
  value       = azurerm_mssql_server.this.name
}

output "sql_database_id" {
  description = "SQL Database resource ID"
  value       = azurerm_mssql_database.this.id
}

output "sql_database_name" {
  description = "SQL Database name"
  value       = azurerm_mssql_database.this.name
}

output "fully_qualified_domain_name" {
  description = "SQL Server fully qualified domain name"
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}