# terraform-module-azurerm-bastion-host

## Usage
See `examples` folders for usage of this module.

## Limitation
- Name of the subnet used for the bastion host should be `AzureBastionSubnet`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | ~>1.44.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| bastion\_host\_locations | List of Azure supported locations where the resource exists. Changing this forces a new resource to be created.Please refer the link for the azure locations : https://docs.microsoft.com/en-us/azure/bastion/bastion-faq | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| bastion\_host\_names | List of names of the Bastion Host. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| bastion\_host\_resource\_group\_names | A list of names of the resource groups in which Bastion Host will be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| bastion\_host\_tags | Tag which will associated to the Bastion Host. | `map` | `{}` | no |
| enabled | Enable or disable this module. | `bool` | `true` | no |
| ip\_configurations | One or more IP configuration blocks. | `list(list(object({ name = string, subnet_id = string, public_ip_address_id = string })))` | <pre>[<br>  null<br>]</pre> | no |
| tags | Tags shared by all resources of this module. Will be merged with any other specific tags by resource. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_host\_dns\_names | The FQDNs for the Bastion Host. |
| bastion\_host\_ids | The IDs of the Bastion Host. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
