provider "azurerm" {
  alias           = "storage_account_sub"
  subscription_id = var.storage_account_subscription_id
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

resource "azurerm_storage_account" "databricks" {
  provider                 = azurerm.storage_account_sub
  name                     = var.storage_account_name
  resource_group_name      = var.storage_account_resource_group_name
  location                 = var.storage_account_location
  tags                     = var.storage_account_tags
  min_tls_version          = "TLS1_2"
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_private_endpoint" "databricks_storage_account" {
  provider            = azurerm.private_endpoint_sub
  name                = var.private_endpoint_name
  resource_group_name = var.private_endpoint_resource_group_name
  location            = var.private_endpoint_location
  subnet_id           = data.azurerm_subnet.databricks.id
  tags                = var.storage_account_tags
  private_service_connection {
    name                           = var.private_endpoint_name
    private_connection_resource_id = azurerm_storage_account.databricks.id
    is_manual_connection           = false
    subresource_names = [
      "blob"
    ]
  }
}
