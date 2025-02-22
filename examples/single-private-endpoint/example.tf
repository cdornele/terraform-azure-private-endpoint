#--------------------------------------------*--------------------------------------------
# Single Example: Azure Private Endpoint
#--------------------------------------------*--------------------------------------------

provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "cdornele/resource-group/azure"
  version = "1.0.0"
  stack     = "example"
  prefixes  = ["az","eus2"]
  suffixes  = ["t","01"]
  location  = "eastus2"
  tags      = {
    "environement" = "example"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.7.29.0/29"]
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = module.resource_group.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.7.29.0/29"]
  private_link_service_network_policies_enabled = false
  private_endpoint_network_policies =  "Enabled"
}

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  sku                 = "Standard"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "example-lb"
  sku                 = "Standard"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  frontend_ip_configuration {
    name                 = azurerm_public_ip.example.name
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_private_link_service" "example" {
  name                = "example-privatelink"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  nat_ip_configuration {
    name      = azurerm_public_ip.example.name
    primary   = true
    subnet_id = azurerm_subnet.example.id
  }

  load_balancer_frontend_ip_configuration_ids = [
    azurerm_lb.example.frontend_ip_configuration[0].id,
  ]
}

module "private_endpoint" {
  source = "../../"
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  private_endpoint_stack = "example"
  private_endpoint_prefixes = ["az","eus2"]
  private_endpoint_suffixes = ["t","01"]
  private_service_connection_stack = "example"
  private_service_connection_prefixes = ["az","eus2"]
  private_service_connection_suffixes = ["t","01"]
  private_endpoint_nic_custom_name  = "nic_pvre_example_t_01"
  private_endpoint_subnet_id = azurerm_subnet.example.id
  private_endpoint_target_resource = azurerm_private_link_service.example.id
  private_endpoint_ip_configurations = [
    {
    name = "nic_pvre_example_ipconfig"
    private_ip_address = "10.7.29.5"
    }
  ]
  private_endpoint_tags = {
    "environement" = "example"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}


# end
#--------------------------------------------*--------------------------------------------