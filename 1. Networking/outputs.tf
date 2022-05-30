output "azurerm_network_security_group_id" {
  value = azurerm_network_security_group.databricks.id
}

output "azurerm_route_table_id" {
  value = azurerm_route_table.databricks.id
}
