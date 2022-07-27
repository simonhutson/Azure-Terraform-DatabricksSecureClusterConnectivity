provider "azurerm" {
  features {}
}

# NSG subscription
provider "azurerm" {
  alias           = "nsg_sub"
  subscription_id = var.nsg_subscription_id
  features {}
}

# Route Table subscription
provider "azurerm" {
  alias           = "route_table_sub"
  subscription_id = var.route_table_subscription_id
  features {}
}

# Firewall subscription
provider "azurerm" {
  alias           = "firewall_sub"
  subscription_id = var.firewall_subscription_id
  features {}
}

# VNET subscription
provider "azurerm" {
  alias           = "vnet_sub"
  subscription_id = var.vnet_subscription_id
  features {}
}

# Get existing Firewall
data "azurerm_firewall" "databricks" {
  provider            = azurerm.firewall_sub
  name                = var.firewall_name
  resource_group_name = var.firewall_resource_group_name
}

# Get existing VNET
data "azurerm_virtual_network" "databricks" {
  provider            = azurerm.vnet_sub
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
}

# Create NSG
resource "azurerm_network_security_group" "databricks" {
  provider            = azurerm.nsg_sub
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_resource_group_name
  tags                = var.network_tags
}

# Create NSG rules required for Databricks
resource "azurerm_network_security_rule" "databricks_worker_to_worker_inbound" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-inbound"
  description                 = "Required for worker nodes communication within a cluster."
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "100"
  direction                   = "Inbound"
}

resource "azurerm_network_security_rule" "databricks_worker_to_databricks_webapp" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-databricks-webapp"
  description                 = "Required for workers communication with Databricks Webapp."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "AzureDatabricks"
  access                      = "Allow"
  priority                    = "100"
  direction                   = "Outbound"
}

resource "azurerm_network_security_rule" "databricks_worker_to_sql" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-sql"
  description                 = "Required for workers communication with Azure SQL services."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Sql"
  access                      = "Allow"
  priority                    = "101"
  direction                   = "Outbound"
}

resource "azurerm_network_security_rule" "databricks_worker_to_storage" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-storage"
  description                 = "Required for workers communication with Azure Storage services."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "Storage"
  access                      = "Allow"
  priority                    = "102"
  direction                   = "Outbound"
}

resource "azurerm_network_security_rule" "databricks_worker_to_worker_outbound" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-worker-outbound"
  description                 = "Required for worker nodes communication within a cluster."
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
  access                      = "Allow"
  priority                    = "103"
  direction                   = "Outbound"
}

resource "azurerm_network_security_rule" "databricks_worker_to_eventhub" {
  network_security_group_name = azurerm_network_security_group.databricks.name
  resource_group_name         = azurerm_network_security_group.databricks.resource_group_name
  name                        = "Microsoft.Databricks-workspaces_UseOnly_databricks-worker-to-eventhub"
  description                 = "Required for worker communication with Azure Eventhub services."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "9093"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "EventHub"
  access                      = "Allow"
  priority                    = "104"
  direction                   = "Outbound"
}

# Create Route Table
resource "azurerm_route_table" "databricks" {
  provider            = azurerm.route_table_sub
  name                = var.route_table_name
  location            = var.route_table_location
  resource_group_name = var.route_table_resource_group_name
  tags                = var.network_tags
}

# Create Routes for Databricks
resource "azurerm_route" "databricks_global" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "DataBricks.Global"
  address_prefix         = "AzureDatabricks"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_sql_uksouth" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "Sql.UKSouth"
  address_prefix         = "Sql.UKSouth"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_sql_ukwest" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "Sql.UKWest"
  address_prefix         = "Sql.UKWest"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_storage_uksouth" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "Storage.UKSouth"
  address_prefix         = "Storage.UKSouth"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_storage_ukwest" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "Storage.UKWest"
  address_prefix         = "Storage.UKWest"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_eventhub_uksouth" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "EventHub.UKSouth"
  address_prefix         = "EventHub.UKSouth"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

resource "azurerm_route" "databricks_eventhub_ukwest" {
  route_table_name       = azurerm_route_table.databricks.name
  resource_group_name    = azurerm_route_table.databricks.resource_group_name
  name                   = "EventHub.UKWest"
  address_prefix         = "EventHub.UKWest"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = data.azurerm_firewall.databricks.ip_configuration[0].private_ip_address
}

# Create Databricks Public Subnet
resource "azurerm_subnet" "databricks_public" {
  virtual_network_name = data.azurerm_virtual_network.databricks.name
  resource_group_name  = data.azurerm_virtual_network.databricks.resource_group_name
  name                 = var.databricks_public_subnet_name
  address_prefixes     = [var.databricks_public_subnet_prefix]
  delegation {
    name = "Microsoft.Databricks.workspaces"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

# Create Databricks Private Subnet
resource "azurerm_subnet" "databricks_private" {
  virtual_network_name = data.azurerm_virtual_network.databricks.name
  resource_group_name  = data.azurerm_virtual_network.databricks.resource_group_name
  name                 = var.databricks_private_subnet_name
  address_prefixes     = [var.databricks_private_subnet_prefix]
  delegation {
    name = "Microsoft.Databricks.workspaces"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

# Create Databricks working Subnet for Private Endpoints and Power BI Data Gateway 
resource "azurerm_subnet" "databricks" {
  virtual_network_name = data.azurerm_virtual_network.databricks.name
  resource_group_name  = data.azurerm_virtual_network.databricks.resource_group_name
  name                 = var.databricks_subnet_name
  address_prefixes     = [var.databricks_subnet_prefix]
}

# Associate Route Table to Public Subnet
resource "azurerm_subnet_route_table_association" "databricks_public" {
  subnet_id      = azurerm_subnet.databricks_public.id
  route_table_id = azurerm_route_table.databricks.id
}

# Associate NSG to Public Subnet
resource "azurerm_subnet_network_security_group_association" "databricks_public" {
  subnet_id                 = azurerm_subnet.databricks_public.id
  network_security_group_id = azurerm_network_security_group.databricks.id
}

# Associate NSG to Private Subnet
resource "azurerm_subnet_network_security_group_association" "_" {
  subnet_id                 = azurerm_subnet.databricks_private.id
  network_security_group_id = azurerm_network_security_group.databricks.id
}
