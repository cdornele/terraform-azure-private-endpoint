# Azure Private Endpoint - Terraform Module - Document

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | 2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurecaf_name.private_endpoint](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |
| [azurecaf_name.private_service_connection](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location | `any` | n/a | yes |
| <a name="input_private_endpoint_ip_configurations"></a> [private\_endpoint\_ip\_configurations](#input\_private\_endpoint\_ip\_configurations) | IP configurations for the private endpoint | <pre>list(object({<br/>    name               = optional(string, "ipconfig")<br/>    member_name        = optional(string)<br/>    subresource_name   = optional(string)<br/>    private_ip_address = string<br/>  }))</pre> | `[]` | no |
| <a name="input_private_endpoint_is_manual_connection"></a> [private\_endpoint\_is\_manual\_connection](#input\_private\_endpoint\_is\_manual\_connection) | Is manual connection | `bool` | `false` | no |
| <a name="input_private_endpoint_nic_custom_name"></a> [private\_endpoint\_nic\_custom\_name](#input\_private\_endpoint\_nic\_custom\_name) | Name of the network interface | `string` | `null` | no |
| <a name="input_private_endpoint_prefixes"></a> [private\_endpoint\_prefixes](#input\_private\_endpoint\_prefixes) | List of prefixes for private endpoint | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_request_message"></a> [private\_endpoint\_request\_message](#input\_private\_endpoint\_request\_message) | Request message | `string` | `null` | no |
| <a name="input_private_endpoint_stack"></a> [private\_endpoint\_stack](#input\_private\_endpoint\_stack) | Name of resource. | `string` | n/a | yes |
| <a name="input_private_endpoint_subnet_id"></a> [private\_endpoint\_subnet\_id](#input\_private\_endpoint\_subnet\_id) | ID of the subnet where the private endpoint will be created | `string` | n/a | yes |
| <a name="input_private_endpoint_subresource_name"></a> [private\_endpoint\_subresource\_name](#input\_private\_endpoint\_subresource\_name) | Subresource name for the private endpoint | `string` | `null` | no |
| <a name="input_private_endpoint_suffixes"></a> [private\_endpoint\_suffixes](#input\_private\_endpoint\_suffixes) | List of suffixes for private endpoint | `list(string)` | `[]` | no |
| <a name="input_private_endpoint_tags"></a> [private\_endpoint\_tags](#input\_private\_endpoint\_tags) | Tags for the private endpoint | `map(string)` | `{}` | no |
| <a name="input_private_endpoint_target_resource"></a> [private\_endpoint\_target\_resource](#input\_private\_endpoint\_target\_resource) | Target resource for the private endpoint | `string` | `null` | no |
| <a name="input_private_service_connection_prefixes"></a> [private\_service\_connection\_prefixes](#input\_private\_service\_connection\_prefixes) | List of prefixes for private service connection | `list(string)` | `[]` | no |
| <a name="input_private_service_connection_stack"></a> [private\_service\_connection\_stack](#input\_private\_service\_connection\_stack) | Name of resource. | `string` | n/a | yes |
| <a name="input_private_service_connection_suffixes"></a> [private\_service\_connection\_suffixes](#input\_private\_service\_connection\_suffixes) | List of suffixes for private service connection | `list(string)` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Resource ID of the Private Endpoint. |
| <a name="output_resource"></a> [resource](#output\_resource) | The resource group, private endpoint, and private dns information. |
<!-- END_TF_DOCS -->