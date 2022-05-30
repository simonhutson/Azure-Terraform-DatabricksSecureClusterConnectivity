variable "network_tags" {
  type = map(any)
  default = {
    "Application ID" : "AP123456",
    "Application Name" : "Elimin8Cancer PoC",
    "Application Owner" : "James Wake",
    "Cost Center" : "123456",
    "Environment" : "POC",
    "Organization" : "Oncology R&D"
  }
}
variable "nsg_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "nsg_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "nsg_name" {
  type    = string
  default = "SRH-NSG-DATABRICKS"
}
variable "nsg_location" {
  type    = string
  default = "westeurope"
}
variable "route_table_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "route_table_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "route_table_name" {
  type    = string
  default = "SRH-RT-DATABRICKS"
}
variable "route_table_location" {
  type    = string
  default = "westeurope"
}
variable "firewall_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "firewall_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "firewall_name" {
  type    = string
  default = "SRH-FIREWALL-01"
}
variable "vnet_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "vnet_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "vnet_name" {
  type    = string
  default = "SRH-VNET-WESTEUROPE"
}
variable "databricks_private_subnet_name" {
  type    = string
  default = "DATABRICKS-01-PRIVATE"
}
variable "databricks_public_subnet_name" {
  type    = string
  default = "DATABRICKS-01-PUBLIC"
}
variable "databricks_subnet_name" {
  type    = string
  default = "DATABRICKS-01"
}
variable "databricks_private_subnet_prefix" {
  type    = string
  default = "10.2.2.0/24"
}
variable "databricks_public_subnet_prefix" {
  type    = string
  default = "10.2.3.0/24"
}
variable "databricks_subnet_prefix" {
  type    = string
  default = "10.2.4.0/24"
}
