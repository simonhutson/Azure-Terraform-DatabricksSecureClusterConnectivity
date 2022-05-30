 variable "storage_account_tags" {
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
variable "storage_account_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "storage_account_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01"
}
variable "storage_account_name" {
  type    = string
  default = "srhstoragedatabricks02"
}
variable "storage_account_location" {
  type    = string
  default = "westeurope"
}
variable "storage_account_tier" {
  type    = string
  default = "Standard"
}
variable "storage_account_replication_type" {
  type    = string
  default = "LRS"
}
variable "private_endpoint_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "private_endpoint_name" {
  type    = string
  default = "SRH-PRIVATEENDPOINT-DATABRICKS-01-STORAGE-01"
}
variable "private_endpoint_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01"
}
variable "private_endpoint_location" {
  type    = string
  default = "westeurope"
}
variable "private_endpoint_subnet_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "private_endpoint_subnet_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "private_endpoint_subnet_vnet_name" {
  type    = string
  default = "SRH-VNET-WESTEUROPE"
}
variable "private_endpoint_subnet_name" {
  type    = string
  default = "DATABRICKS-01"
}