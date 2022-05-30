output "azurerm_storage_account_databricks_id" {
  value = azurerm_storage_account.databricks.id
}
output "azurerm_private_endpoint_databricks_storage_account_id" {
  value = azurerm_private_endpoint.databricks_storage_account.id
}
