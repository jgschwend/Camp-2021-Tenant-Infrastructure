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