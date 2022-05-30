variable "vnet_databricks_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "vnet_databricks_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "vnet_databricks_name" {
  type    = string
  default = "SRH-VNET-WESTEUROPE"
}
variable "vnet_databricks_public_subnet_name" {
  type    = string
  default = "DATABRICKS-01-PUBLIC"
}
variable "firewall_policy_subscription_id" {
  type    = string
  default = "25d7b58f-a2ed-4c46-a3f7-1748a5e0934b"
}
variable "firewall_policy_resource_group_name" {
  type    = string
  default = "SRH-CORE"
}
variable "firewall_policy_name" {
  type    = string
  default = "SRH-FIREWALLPOLICY-01"
}
variable "firewall_rule_collection_group_name" {
  type    = string
  default = "SRH-RULECOLLECTIONGROUP-DATABRICKS-01"
}
variable "firewall_rule_collection_name" {
  type    = string
  default = "SRH-RULECOLLECTION-DATABRICKS-01"
}