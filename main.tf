resource "azurerm_resource_group" "default" {
  name     = var.name
  location = var.location
}

resource "azurerm_storage_account" "default" {
  name                     = substr(lower(replace(var.name, "-", "")), 0, 24)
  resource_group_name      = azurerm_resource_group.default.name
  location                 = var.location
  account_tier             = var.sa_settings.account_tier
  account_replication_type = var.sa_settings.account_replication_type
  account_kind             = var.sa_settings.account_kind
  min_tls_version          = "TLS1_2"
  tags                     = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_storage_container" "default" {
  for_each              = toset(var.storage_containers)
  name                  = each.value
  storage_account_name  = azurerm_storage_account.default.name
  container_access_type = "private"
}