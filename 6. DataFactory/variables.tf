variable "datafactory_tags" {
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
variable "datafactory_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "datafactory_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01"
}
variable "datafactory_location" {
  type    = string
  default = "westeurope"
}
variable "datafactory_name" {
  type    = string
  default = "SRH-DATAFACTORY-01"
}
variable "mssql_server_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "mssql_server_resource_group_name" {
  type    = string
  default = "SRH-RG-DATABRICKS-01"
}
variable "mssql_server_name" {
  type    = string
  default = "srh-mssql-server-01"
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
variable "private_endpoint_sql_name" {
  type    = string
  default = "SRH-PRIVATEENDPOINT-DATABRICKS-01-SQL-SERVER-01"
}
variable "private_endpoint_storage_account_name" {
  type    = string
  default = "SRH-PRIVATEENDPOINT-DATABRICKS-01-STORAGE-ACCOUNT-01"
}
