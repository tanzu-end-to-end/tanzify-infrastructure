# What is this?
Paves Network for Harbor on Azure.

## How do I use this? 
Best to use it with [Terragrunt](https://terragrunt.gruntwork.io/). 

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| azurerm | ~> 1.43 |

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
| hosted\_zone | Hosted zone name (e.g. foo.example.com) that is registered with Azure DNS. | `string` | n/a | yes |
| location | Azure location | `string` | n/a | yes |
| resource\_group\_name | Azure Resource Group. | `any` | n/a | yes |
| subscription\_id | Azure Subscription ID | `string` | n/a | yes |
| tags | Key/value tags to assign to all resources. | `map(string)` | `{}` | no |
| tenant\_id | Azure tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| harbor\_domain | n/a |
| harbor\_lb\_application\_security\_group\_name | n/a |
| harbor\_lb\_security\_group\_name | n/a |
| harbor\_web\_lb\_name | n/a |

