provider "azurerm" {
  features {}
}

# Datafactory subscription
provider "azurerm" {
  alias           = "datafactory_sub"
  subscription_id = var.datafactory_subscription_id
  features {}
}

# SQL Server subscription
provider "azurerm" {
  alias           = "mssql_server_sub"
  subscription_id = var.mssql_server_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "storage_account_sub"
  subscription_id = var.storage_account_subscription_id
  features {}
}

# Get existing SQL Server
data "azurerm_mssql_server" "databricks" {
  provider            = azurerm.mssql_server_sub
  name                = var.mssql_server_name
  resource_group_name = var.mssql_server_resource_group_name
}

# Get existing Storage Account
data "azurerm_storage_account" "databricks" {
  provider            = azurerm.storage_account_sub
  name                = var.storage_account_name
  resource_group_name = var.storage_account_resource_group_name
}


resource "azurerm_data_factory" "databricks" {
  provider            = azurerm.datafactory_sub
  name                = var.datafactory_name
  resource_group_name = var.datafactory_resource_group_name
  location            = var.datafactory_location
  tags = var.datafactory_tags
  managed_virtual_network_enabled = true
}

resource "azurerm_data_factory_managed_private_endpoint" "databricks_private_endpoint_sql" {
  name               = var.private_endpoint_sql_name
  data_factory_id    = azurerm_data_factory.databricks.id
  target_resource_id = data.azurerm_mssql_server.databricks.id
  subresource_name   = "sqlServer"
}

resource "azurerm_data_factory_managed_private_endpoint" "databricks_private_endpoint_storage_account" {
  name               = var.private_endpoint_storage_account_name
  data_factory_id    = azurerm_data_factory.databricks.id
  target_resource_id = data.azurerm_storage_account.databricks.id
  subresource_name   = "blob"
}
