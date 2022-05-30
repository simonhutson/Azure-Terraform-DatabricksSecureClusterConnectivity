provider "azurerm" {
  features {}
}

# Databricks VNET subscription
provider "azurerm" {
  alias           = "vnet_databricks_sub"
  subscription_id = var.vnet_databricks_subscription_id
  features {}
}

# Firewall Policy subscription
provider "azurerm" {
  alias           = "firewall_policy_sub"
  subscription_id = var.firewall_policy_subscription_id
  features {}
}

# Get existing Databricks public subnet
data "azurerm_subnet" "databricks_public" {
  provider             = azurerm.vnet_databricks_sub
  virtual_network_name = var.vnet_databricks_name
  name                 = var.vnet_databricks_public_subnet_name
  resource_group_name  = var.vnet_databricks_resource_group_name
}

# Get existing Firewall Policy
data "azurerm_firewall_policy" "databricks" {
  provider            = azurerm.firewall_policy_sub
  name                = var.firewall_policy_name
  resource_group_name = var.firewall_policy_resource_group_name
}

locals {
  subnet_databricks_public-address_prefixes = data.azurerm_subnet.databricks_public.address_prefixes
}

resource "azurerm_firewall_policy_rule_collection_group" "databricks" {
  name               = var.firewall_rule_collection_group_name
  firewall_policy_id = data.azurerm_firewall_policy.databricks.id
  priority           = 500
  network_rule_collection {
    name     = var.firewall_rule_collection_name
    action   = "Allow"
    priority = 500
    rule {
      name                  = "Databricks.Global"
      protocols             = ["TCP"]
      source_addresses      = local.subnet_databricks_public-address_prefixes
      destination_addresses = ["AzureDatabricks"]
      destination_ports     = ["443"]
    }
    rule {
      name      = "MySql.WestEurope"
      protocols = ["TCP"]
      #      source_addresses      = [var.databricks_public_subnet_prefix]
      source_addresses      = local.subnet_databricks_public-address_prefixes
      destination_addresses = ["Sql.WestEurope"]
      destination_ports     = ["3306"]
    }
    rule {
      name                  = "Storage.WestEurope Storage.NorthEurope"
      protocols             = ["TCP"]
      source_addresses      = local.subnet_databricks_public-address_prefixes
      destination_addresses = ["Storage.WestEurope", "Storage.NorthEurope"]
      destination_ports     = ["443"]
    }
    rule {
      name                  = "EventHub.WestEurope"
      protocols             = ["TCP"]
      source_addresses      = local.subnet_databricks_public-address_prefixes
      destination_addresses = ["EventHub.WestEurope"]
      destination_ports     = ["9093"]
    }
  }
}
