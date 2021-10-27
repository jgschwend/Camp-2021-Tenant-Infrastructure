locals {
  location = "switzerlandnorth"
  prefix   = "camp"

  tags = {
    environment = var.environment
    solution    = "Tenant Management"
    version     = var.deployment_version
    createdBy   = "Terraform"
  }
}

resource "azurerm_resource_group" "tenant" {
  name     = "${local.prefix}-rg-${var.environment}"
  location = local.location

  tags = local.tags
}

resource "azurerm_app_service_plan" "plan" {
  location            = local.location
  name                = "${local.prefix}-plan-${var.environment}"
  resource_group_name = azurerm_resource_group.tenant.name
  sku {
    tier = "Free"
    size = "F1"
  }
}