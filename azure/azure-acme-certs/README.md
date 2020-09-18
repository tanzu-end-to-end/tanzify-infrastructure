
# What is this?
Generates TLS certificates using LetsEncrypt on Azure.

## How do I use this? 
Best to use it using [Terragrunt](https://terragrunt.gruntwork.io/). 



## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| terraform | >= 0.13 |
| azurerm | ~> 1.43 |
| random | ~> 2.2 |
| tls | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| acme | n/a |
| azurerm | ~> 1.43 |
| tls | ~> 2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_server\_url | ACME API service endpoint. Points to LetsEncrypt by default. | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| client\_id | Azure Client ID | `string` | n/a | yes |
| client\_secret | Azure Client Secret | `string` | n/a | yes |
| cloud\_name | The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment | `string` | n/a | yes |
| environment\_name | Name of the environment. This is prefixed with the hosted\_zone DNS to generate the Common Name for the TLS certificate. | `string` | n/a | yes |
| hosted\_zone | Hosted zone name (e.g. foo.example.com) that is registered with Azure DNS. | `string` | n/a | yes |
| location | Azure location | `string` | n/a | yes |
| subject\_alternative\_names | SANs to support. Put your wildcard and subdomains here. | `list` | n/a | yes |
| subscription\_id | Azure Subscription ID | `string` | n/a | yes |
| tenant\_id | Azure tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cert\_ca | n/a |
| cert\_full\_chain | n/a |
| cert\_private\_key | n/a |

