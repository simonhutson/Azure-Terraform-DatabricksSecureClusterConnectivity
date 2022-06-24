 variable "mssql_tags" {
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
variable "mssql_server_location" {
  type    = string
  default = "uksouth"
}
variable "mssql_server_version" {
  type    = string
  default = "12.0"
}
variable "mssql_server_administrator_login" {
  type    = string
}
variable "mssql_server_administrator_login_password" {
  type    = string
}
variable "mssql_database_name" {
  type    = string
  default = "az_data_model_new"
}
variable "private_endpoint_subscription_id" {
  type    = string
  default = "72ed9c19-6e49-4acd-98f2-0859cf924b5b"
}
variable "private_endpoint_name" {
  type    = string
  default = "az-preview-eu-oncologypoc-sql-server-01-ep"
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
