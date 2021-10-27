resource "azurerm_storage_account" "tenant-tfstate" {
  name                = "${local.prefix}tfstatest${var.environment}"
  resource_group_name = azurerm_resource_group.tenant.name
  location            = local.location

  account_tier              = "Standard"
  account_replication_type  = "GRS"
  allow_blob_public_access  = false
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  tags = merge(local.tags)
}

resource "azurerm_storage_container" "tenant" {
  name                  = "${local.prefix}-tfstate"
  container_access_type = "private"
  storage_account_name  = azurerm_storage_account.tenant-tfstate.name
}