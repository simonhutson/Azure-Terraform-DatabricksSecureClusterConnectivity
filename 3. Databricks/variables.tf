variable "databricks_tags" {
  type = map(any)
  default = {
    "Application ID" : "NA",
    "Application Name" : "Oncology",
    "Application Owner" : "Innotech",
    "Cost Center" : "6807",
    "Creation Date" : "",
    "Environment" : "Dev",
    "IDMD No" : "IDMD0000000",
    "Organization" : "CSIS"
  }
}
variable "databricks_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "databricks_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "databricks_managed_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-managed-rsg"
}
variable "databricks_location" {
  type    = string
  default = "uksouth"
}
variable "databricks_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-dbw-01"
}
variable "databricks_private_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-private-subnet"
}
variable "databricks_public_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-public-subnet"
}
variable "databricks_storage_account_name" {
  type    = string
  default = "azpreuondbw01"
}
variable "vnet_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "vnet_resource_goup_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "vnet_name" {
  type    = string
  default = "az-preview-eu-vnet"
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
