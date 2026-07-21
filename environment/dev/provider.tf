terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.76.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "dev-rg"
  #   storage_account_name = "dev-stgs"          
  #   container_name       = "tfstate-dev"                           
  #   key                  = "dev.terraform.tfstate"          
  # }

}

provider "azurerm" {
  features {}
  # Configuration options
}