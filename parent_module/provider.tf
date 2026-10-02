terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.7.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-rg"
    storage_account_name = "tfstorage0909"
    container_name       = "tfstate"
    key                  = "practice.tfstate"

  }
}

provider "azurerm" {
  features {}

}