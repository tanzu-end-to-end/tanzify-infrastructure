# What is this?
Creates OpsMan VM on Azure.

## How do I use this? 
Best to use it with [Terragrunt](https://terragrunt.gruntwork.io/). 



## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| azurerm | ~> 1.43 |
| random | ~> 2.2 |
| tls | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 1.43 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_id | Azure Client ID | `string` | n/a | yes |
| client\_secret | Azure Client Secret | `string` | n/a | yes |
| cloud\_name | The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment | `string` | n/a | yes |
| environment\_name | Name of the environment. This is prefixed with the hosted\_zone DNS to generate the Common Name for the TLS certificate. | `string` | n/a | yes |
| image\_location | This is where the Opsman local images are stored. Possible values are westus, eastus, westeurope, southeastasia | `string` | `"eastus"` | no |
| location | Azure location | `string` | n/a | yes |
| ops\_manager\_dns | OpsMan DNS name. Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| ops\_manager\_instance\_type | n/a | `string` | `"Standard_DS2_v2"` | no |
| ops\_manager\_private\_ip | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| ops\_manager\_security\_group\_name | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| ops\_manager\_ssh\_private\_key | n/a | `string` | n/a | yes |
| ops\_manager\_ssh\_public\_key | n/a | `string` | n/a | yes |
| ops\_manager\_storage\_account\_name | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| ops\_manager\_storage\_container\_name | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| opsman\_build | n/a | `string` | n/a | yes |
| opsman\_version | n/a | `string` | n/a | yes |
| resource\_group\_name | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| subnet\_id | Output from https://github.com/pivotal/paving/azure | `any` | n/a | yes |
| subscription\_id | Azure Subscription ID | `string` | n/a | yes |
| tags | Tags to apply to resources | `map(string)` | `{}` | no |
| tenant\_id | Azure tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ops\_manager\_dns | ==================== Outputs |
| ops\_manager\_ssh\_private\_key | n/a |

