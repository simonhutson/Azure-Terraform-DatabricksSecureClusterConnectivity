variable "network_tags" {
  type = map(any)
  default = {
    "Application ID" : "",
    "Application Name" : "",
    "Application Owner" : "",
    "Cost Center" : "",
    "Creation Date" : "",
    "Environment" : "",
    "IDMD No" : "",
    "Organization" : ""
  }
}
variable "nsg_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "nsg_resource_group_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "nsg_name" {
  type    = string
  default = "az-preview-eu-databricks-nsg"
}
variable "nsg_location" {
  type    = string
  default = "uksouth"
}
variable "route_table_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "route_table_resource_group_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "route_table_name" {
  type    = string
  default = "az-preview-eu-databrickssubnet-rt"
}
variable "route_table_location" {
  type    = string
  default = "uksouth"
}
variable "firewall_subscription_id" {
  type    = string
  default = "e63a6060-c456-481c-bfd1-92b73a1d389e"
}
variable "firewall_resource_group_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "firewall_name" {
  type    = string
  default = "az-hub-eu-firewall"
}
variable "vnet_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "vnet_resource_group_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "vnet_name" {
  type    = string
  default = "az-preview-eu-vnet"
}
variable "databricks_private_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-private-subnet"
}
variable "databricks_public_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-public-subnet"
}
variable "databricks_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-subnet"
}
variable "databricks_private_subnet_prefix" {
  type    = string
  default = "10.211.246.0/26"
}
variable "databricks_public_subnet_prefix" {
  type    = string
  default = "10.211.246.64/26"
}
variable "databricks_subnet_prefix" {
  type    = string
  default = "10.211.246.128/26"
}
