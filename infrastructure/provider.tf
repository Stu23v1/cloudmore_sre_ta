# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.70"
    }
  }

  backend "azurerm" {

    # Variables can not be used here. See readme
    resource_group_name  = "production-resources"
    storage_account_name = "terraformstatesd00001"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }

  required_version = "~> 1.0.0"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

}
