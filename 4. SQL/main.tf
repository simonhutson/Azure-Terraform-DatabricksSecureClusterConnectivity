provider "azurerm" {
  features {}
}

# SQL Server subscription
provider "azurerm" {
  alias           = "mssql_server_sub"
  subscription_id = var.mssql_server_subscription_id
  features {}
}

# Private Endpoint subscription
provider "azurerm" {
  alias           = "private_endpoint_sub"
  subscription_id = var.private_endpoint_subscription_id
  features {}
}

# Get existing Subnet
data "azurerm_subnet" "databricks" {
  provider             = azurerm.private_endpoint_sub
  name                 = var.private_endpoint_subnet_name
  virtual_network_name = var.private_endpoint_subnet_vnet_name
  resource_group_name  = var.private_endpoint_subnet_resource_group_name
}

resource "azurerm_mssql_server" "databricks" {
  provider                     = azurerm.mssql_server_sub
  name                         = var.mssql_server_name
  resource_group_name          = var.mssql_server_resource_group_name
  location                     = var.mssql_server_location
  tags                         = var.mssql_tags
  administrator_login          = var.mssql_server_administrator_login
  administrator_login_password = var.mssql_server_administrator_login_password
  version                      = "12.0"
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "databricks" {
  provider = azurerm.mssql_server_sub
  name = var.mssql_database_name
  server_id = azurerm_mssql_server.databricks.id
  sku_name = "GP_Gen5_2"
  collation = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  read_scale = false
  ledger_enabled = false
  zone_redundant = false
  geo_backup_enabled = true
  transparent_data_encryption_enabled = true
  depends_on = [
    azurerm_mssql_server.databricks
  ]
}

resource "azurerm_private_endpoint" "databricks_sql" {
  provider            = azurerm.private_endpoint_sub
  name                = var.private_endpoint_name
  resource_group_name = var.private_endpoint_resource_group_name
  location            = var.private_endpoint_location
  subnet_id           = data.azurerm_subnet.databricks.id
  tags                = var.mssql_tags
  private_service_connection {
    name = var.private_endpoint_name
    private_connection_resource_id = azurerm_mssql_server.databricks.id
    is_manual_connection = false
    subresource_names = [
      "sqlServer"
    ]
  }
  depends_on = [
    azurerm_mssql_server.databricks
  ]
}
