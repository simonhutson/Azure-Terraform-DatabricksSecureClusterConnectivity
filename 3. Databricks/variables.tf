variable "databricks_tags" {
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
variable "databricks_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "databricks_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01"
}
variable "databricks_managed_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01-MANAGED"
}
variable "databricks_location" {
  type    = string
  default = "westeurope"
}
variable "databricks_name" {
  type    = string
  default = "SRH-DATABRICKS-01"
}
variable "databricks_private_subnet_name" {
  type    = string
  default = "DATABRICKS-01-PRIVATE"
}
variable "databricks_public_subnet_name" {
  type    = string
  default = "DATABRICKS-01-PUBLIC"
}
variable "databricks_storage_account_name" {
  type    = string
  default = "srhstoragedatabricks01"
}
variable "vnet_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "vnet_resource_goup_name" {
  type    = string
  default = "SRH-CORE"
}
variable "vnet_name" {
  type    = string
  default = "SRH-VNET-WESTEUROPE"
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
