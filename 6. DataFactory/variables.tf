variable "datafactory_tags" {
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
variable "datafactory_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "datafactory_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "datafactory_location" {
  type    = string
  default = "uksouth"
}
variable "datafactory_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-df-01"
}
variable "mssql_server_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "mssql_server_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "mssql_server_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-sql-server-01"
}
variable "storage_account_subscription_id" {
  type    = string
  default = "2ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "storage_account_resource_group_name" {
  type    = string
  default = "az-preview-eu-oncology-rsg"
}
variable "storage_account_name" {
  type    = string
  default = "azpreuondbw02"
}
variable "private_endpoint_sql_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-sql-server-01-ep"
}
variable "private_endpoint_storage_account_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-storage-account-02-ep"
}
