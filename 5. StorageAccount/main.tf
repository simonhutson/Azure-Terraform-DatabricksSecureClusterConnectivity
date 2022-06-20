provider "azurerm" {
  features {}
}

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
  provider                          = azurerm.storage_account_sub
  name                              = var.storage_account_name
  resource_group_name               = var.storage_account_resource_group_name
  location                          = var.storage_account_location
  tags                              = var.storage_account_tags
  account_tier                      = "Standard"
  account_replication_type          = "LRS"
  account_kind                      = "StorageV2"
  access_tier                       = "Hot"
  is_hns_enabled                    = true
  min_tls_version                   = "TLS1_2"
  enable_https_traffic_only         = true
  infrastructure_encryption_enabled = true
  cross_tenant_replication_enabled  = false
  shared_access_key_enabled         = true
  nfsv3_enabled                     = false
  allow_nested_items_to_be_public   = false
  blob_properties {
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days = 7
    }
  }
  network_rules {
    default_action = "Allow"
    bypass = [
      "AzureServices"
    ]
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }
}

resource "azurerm_storage_container" "databricks_azdatadl" {
  name                  = "azdatadl"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_flatiron" {
  name                  = "flatiron"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_flatiron_aws" {
  name                  = "flatiron-aws"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_flatiron_raw" {
  name                  = "flatiron-raw"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_flatiron_unittesting" {
  name                  = "flatiron-unittesting"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_landing" {
  name                  = "landing"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_processed_data" {
  name                  = "processed-data"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_raw" {
  name                  = "raw"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
}

resource "azurerm_storage_container" "databricks_test_samples" {
  name                  = "test-samples"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.databricks
  ]
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
  depends_on = [
    azurerm_storage_account.databricks
  ]
}
