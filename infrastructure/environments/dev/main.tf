terraform {
  backend "azurerm" {
    container_name       = "camp-tfstate"
    key                  = "tenant"
    resource_group_name  = "camp-rg-global"
    storage_account_name = "camptfstatestglobal"
    subscription_id      = "6c9b3255-7353-4eb6-bbc5-16d5fc2cdfea"
    tenant_id            = "dddb445f-e102-4886-be3c-35a50d1ab51e"
  }
}

# Used for initial, manual deployment
# - init, plan, apply with local backend
# - change backend
# - init and upload state
/*terraform {
  backend "local" {
    path = "tflocal/state.tfstate"
  }
}*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.82.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.7.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "6c9b3255-7353-4eb6-bbc5-16d5fc2cdfea"
  tenant_id       = "dddb445f-e102-4886-be3c-35a50d1ab51e"
  features {}
}

provider "azuread" {
  tenant_id = "dddb445f-e102-4886-be3c-35a50d1ab51e"
}

locals {
  environment        = "global"
  deployment_version = var.deployment_version
}

module "tenant" {
  source             = "../../resources"
  environment        = local.environment
  deployment_version = local.deployment_version
}