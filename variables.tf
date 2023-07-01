variable "name" {
  type        = string
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "name_resource_group" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable "sa_settings" {
  type = object({
    account_tier             = string
    account_replication_type = string
    account_kind             = string
  })
  default = {
    account_tier             = "Standard"
    account_replication_type = "GRS"
    account_kind             = "StorageV2"
  }
  description = "(Optional) Define Storage account settings"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "storage_containers" {
  type        = list(string)
  description = "List of storage containers to be created in the storage."
}