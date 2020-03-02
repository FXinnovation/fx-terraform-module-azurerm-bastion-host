# terraform-module-azurerm-bastion-host

## Usage
See `examples` folders for usage of this module.

## Limitation
- Name of the subnet used for the bastion host should be `AzureBastionSubnet`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 1.36.0, < 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| bastion\_host\_location | The Azure supported location where the resource exists. Changing this forces a new resource to be created.Please refer the link for the azure locations : https://docs.microsoft.com/en-us/azure/bastion/bastion-faq | `string` | `""` | no |
| bastion\_host\_name | Specifies name of the Bastion Host. Changing this forces a new resource to be created. | `string` | `""` | no |
| bastion\_host\_resource\_group\_name | Specifies name of the resource group in which Bastion Host will be created. | `string` | `""` | no |
| bastion\_host\_tags | Tag which will associated to the Bastion Host. | `map` | `{}` | no |
| enabled | Enable or disable this module. | `bool` | `true` | no |
| existing\_public\_ip\_address\_id | The ID of the existing public IP address. | `string` | `""` | no |
| existing\_public\_ip\_enabled | Boolean flag which describes whether to use existing Public IP or not. | `bool` | `false` | no |
| ip\_configurations | One or more IP configuration blocks. | `list(object({ name = string, subnet_id = string }))` | `[]` | no |
| public\_ip\_allocation\_method | Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`. | `string` | `"Dynamic"` | no |
| public\_ip\_enabled | Boolean flag which describes whether or not to enable the Public IP. | `bool` | `false` | no |
| public\_ip\_location | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `""` | no |
| public\_ip\_name | Specifies the name of the Public IP resource. Changing this forces a new resource to be created. | `string` | `""` | no |
| public\_ip\_resource\_group\_name | The name of the resource group in which to create the Public IP. | `string` | `""` | no |
| public\_ip\_sku | The SKU of the Public IP. Accepted values are `Basic` and `Standard`. Defaults to `Basic`. | `string` | `"Basic"` | no |
| public\_ip\_tags | Tags which will be associated to the Public IP. | `map` | `{}` | no |
| tags | Tags shared by all resources of this module. Will be merged with any other specific tags by resource. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_host\_dns\_name | The FQDNs for the Bastion Host. |
| bastion\_host\_id | The IDs of the Bastion Host. |
| public\_ip\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
