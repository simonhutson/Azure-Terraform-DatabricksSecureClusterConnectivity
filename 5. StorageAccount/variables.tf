 variable "storage_account_tags" {
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
variable "storage_account_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "storage_account_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "storage_account_name" {
  type    = string
  default = "azpreuondbw02"
}
variable "storage_account_location" {
  type    = string
  default = "uksouth"
}
variable "private_endpoint_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "private_endpoint_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-storage-account-02-ep"
}
variable "private_endpoint_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "private_endpoint_location" {
  type    = string
  default = "uksouth"
}
variable "private_endpoint_subnet_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "private_endpoint_subnet_resource_group_name" {
  type    = string
  default = "az-preview-eu-networking-rsg"
}
variable "private_endpoint_subnet_vnet_name" {
  type    = string
  default = "az-preview-eu-vnet"
}
variable "private_endpoint_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-subnet"
}
