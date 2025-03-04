
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
  subscription_id = "d142c4c7-733e-4ee6-9bb4-bcbe829e13c2" 
}

#Data block to get info of Resource group

data "azurerm_resource_group" "tf_rg" {
  name = "rg"
}


resource "azurerm_storage_account" "storage_account" {
  name                     = "tfexampletest234"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_resource_group" "rg" {
  name = "mentor-rg"
location = "east US"
}
