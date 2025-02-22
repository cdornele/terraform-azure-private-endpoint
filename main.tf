#--------------------------------------------*--------------------------------------------
# Module: Azure Private Endpoint - Main
#--------------------------------------------*--------------------------------------------

data "azurecaf_name" "private_endpoint" {
  name          = var.private_endpoint_stack
  resource_type = "azurerm_mysql_flexible_server"
  prefixes      = var.private_endpoint_prefixes
  suffixes      = var.private_endpoint_suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "private_service_connection" {
  name          = var.private_service_connection_stack
  resource_type = "azurerm_mysql_flexible_server"
  prefixes      = var.private_service_connection_prefixes
  suffixes      = var.private_service_connection_suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

resource "azurerm_private_endpoint" "this" {
  name     = data.azurecaf_name.private_endpoint.result
  location = var.location

  resource_group_name = var.resource_group_name

  custom_network_interface_name = var.private_endpoint_nic_custom_name

  subnet_id = var.private_endpoint_subnet_id

  dynamic "ip_configuration" {
    for_each = var.private_endpoint_ip_configurations
    content {
      name               = ip_configuration.value.name
      member_name        = local.is_not_private_link_service ? ip_configuration.value.member_name : null
      subresource_name   = local.is_not_private_link_service ? coalesce(ip_configuration.value.subresource_name, var.private_endpoint_subresource_name) : null
      private_ip_address = ip_configuration.value.private_ip_address
    }
  }

  private_service_connection {
    name                              = data.azurecaf_name.private_service_connection.result
    is_manual_connection              = var.private_endpoint_is_manual_connection
    request_message                   = var.private_endpoint_is_manual_connection ? var.private_endpoint_request_message : null
    private_connection_resource_id    = local.resource_id
    private_connection_resource_alias = local.resource_alias
    subresource_names                 = local.is_not_private_link_service ? [var.private_endpoint_subresource_name] : null
  }

  tags = var.private_endpoint_tags
}


# end
#--------------------------------------------*--------------------------------------------