# Azure Terraform Databricks Secure Cluster Connectivity (SCC)

1. Networking - Add three databricks subnets to an existing virtual network, create a network security group and a route table and assign them to the correct subnets.
2. Firewall - Add an firewall rule collection to an existing Azure firewall policy to allow outbound databricks management traffic.
3. Databricks - Create databricks in a secure cluster connectivity configuration, using the subnets created prevously.
4. SQL - Create a SQL server with a private endpoint.
5. StorageAccount - Create a storage account with a private endpoint.
6. DataFactory - Creae a data factory with a managed virtual network and create private endpoints for the SQL server and storage account.
