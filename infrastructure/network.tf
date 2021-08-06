data "azurerm_resource_group" "west_eu" {
  name = "production-resources"
}

# Terraform Azure RM Module for Network
# https://registry.terraform.io/modules/Azure/network/azurerm/3.5.0
module "production_network" {
  source  = "Azure/network/azurerm"
  version = "3.5.0"

  resource_group_name = data.azurerm_resource_group.west_eu.name
  address_spaces      = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Storage"],
    "subnet2" : ["Microsoft.Storage"],
    "subnet3" : ["Microsoft.Storage"]
  }

  tags = {
    environment = "production"
    costcenter  = "sre"
  }

}
