 variable "mssql_tags" {
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
variable "mssql_server_location" {
  type    = string
  default = "westeurope"
}
variable "mssql_server_version" {
  type    = string
  default = "12.0"
}
variable "mssql_server_administrator_login" {
  type    = string
  default = "srh"
}
variable "mssql_server_administrator_login_password" {
  type    = string
  default = "SqlP@ssW0rd192837465"
}
variable "private_endpoint_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "private_endpoint_name" {
  type    = string
  default = "SRH-PRIVATEENDPOINT-DATABRICKS-01-MYSQL-SERVER-01"
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
