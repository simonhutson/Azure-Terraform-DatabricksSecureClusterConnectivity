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
variable "databricks_public_subnet_name" {
  type    = string
  default = "az-preview-eu-databricks-public-subnet"
}
variable "firewall_policy_subscription_id" {
  type    = string
  default = "e63a6060-c456-481c-bfd1-92b73a1d389e"
}
variable "firewall_policy_resource_group_name" {
  type    = string
  default = "az-connectivity-eu-networking-rsg"
}
variable "firewall_policy_name" {
  type    = string
  default = "az-hub-eu-firewall-policy"
}
variable "firewall_rule_collection_group_name" {
  type    = string
  default = "az-hub-eu-firewall-application-rcg"
}
variable "firewall_rule_collection_name" {
  type    = string
  default = "az-hub-eu-firewall-databricks-poc-allow-rc"
}
