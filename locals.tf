#--------------------------------------------*--------------------------------------------
# Module: Azure Private Endpoint - Locals
#--------------------------------------------*--------------------------------------------

locals {
  resource_alias = length(regexall("^([a-z0-9\\-]+)\\.([a-z0-9\\-]+)\\.([a-z]+)\\.(azure)\\.(privatelinkservice)$", var.private_endpoint_target_resource)) == 1 ? var.private_endpoint_target_resource : null
  resource_id    = length(regexall("^\\/(subscriptions)\\/([a-z0-9\\-]+)\\/(resourceGroups)\\/([A-Za-z0-9\\-_]+)\\/(providers)\\/([A-Za-z\\.]+)\\/([A-Za-z]+)\\/([A-Za-z0-9\\-]+)", var.private_endpoint_target_resource)) == 1 ? var.private_endpoint_target_resource : null

  is_not_private_link_service = local.resource_alias == null && !contains(try(split("/", local.resource_id), []), "privateLinkServices")
}

# end
#--------------------------------------------*--------------------------------------------