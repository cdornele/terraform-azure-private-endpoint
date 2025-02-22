#--------------------------------------------*--------------------------------------------
# Module: Azure Private Endpoint - Output
#--------------------------------------------*--------------------------------------------

output "id" {
  description = "The Resource ID of the Private Endpoint."
  value = azurerm_private_endpoint.this.id
}

output "resource" {
  description = "The resource group, private endpoint, and private dns information."
  value = azurerm_private_endpoint.this
}


# end
#--------------------------------------------*--------------------------------------------