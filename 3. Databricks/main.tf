provider "azurerm" {
  features {}
}

# Databricks subscription
provider "azurerm" {
  alias           = "databricks-sub"
  subscription_id = var.databricks_subscription_id
  features {}
}

# VNET subscription
provider "azurerm" {
  alias           = "vnet-sub"
  subscription_id = var.vnet_subscription_id
  features {}
}

# NSG subscription
provider "azurerm" {
  alias           = "nsg-sub"
  subscription_id = var.nsg_subscription_id
  features {}
}

# Get existing VNET
data "azurerm_virtual_network" "databricks" {
  provider            = azurerm.vnet-sub
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_goup_name
}

# Get existing NSG
data "azurerm_network_security_group" "databricks" {
  provider            = azurerm.nsg-sub
  name                = var.nsg_name
  resource_group_name = var.nsg_resource_group_name
}

# Create Databricks Resource Group
resource "azurerm_resource_group" "databricks" {
  provider = azurerm.databricks-sub
  name     = var.databricks_resource_group_name
  location = var.databricks_location
  tags     = var.databricks_tags
}

# Create Databricks workspace
resource "azurerm_databricks_workspace" "databricks" { 
  provider                    = azurerm.databricks-sub
  name                        = var.databricks_name
  resource_group_name         = azurerm_resource_group.databricks.name
  location                    = azurerm_resource_group.databricks.location
  sku                         = "standard"
  tags                        = var.databricks_tags
  managed_resource_group_name = var.databricks_managed_resource_group_name
  custom_parameters {
    no_public_ip                                         = true
    virtual_network_id                                   = data.azurerm_virtual_network.databricks.id
    private_subnet_name                                  = var.databricks_private_subnet_name
    public_subnet_name                                   = var.databricks_public_subnet_name
    storage_account_name                                 = var.databricks_storage_account_name
    storage_account_sku_name                             = "Standard_GRS"
    public_subnet_network_security_group_association_id  = data.azurerm_network_security_group.databricks.id
    private_subnet_network_security_group_association_id = data.azurerm_network_security_group.databricks.id
  }
}
