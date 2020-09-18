# What is this?
Generates TLS certificates using LetsEncrypt on GCP.

## How do I use this? 
Best to use it using [Terragrunt](https://terragrunt.gruntwork.io/). 


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| terraform | >= 0.13 |
| tls | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| acme | n/a |
| google | n/a |
| tls | ~> 2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_server\_url | ACME API service endpoint. Points to LetsEncrypt by default. | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| environment\_name | Name of the environment. This is prefixed with the hosted\_zone DNS to generate the Common Name for the TLS certificate. | `string` | n/a | yes |
| hosted\_zone | The name of the Google Cloud DNS zone managing the DNS for a domain (e.g. foo.example.com) | `string` | n/a | yes |
| project | GCP Project Name | `any` | n/a | yes |
| region | GCP Region | `any` | n/a | yes |
| service\_account\_key | GCP Service Account Key in JSON format | `any` | n/a | yes |
| subject\_alternative\_names | SANs to support. Put your wildcard and subdomains here. | `list` | <pre>[<br>  "opsmanager",<br>  "*.apps",<br>  "*.sys",<br>  "*.uaa.sys",<br>  "*.login.sys",<br>  "*.pks",<br>  "harbor"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| cert\_ca | n/a |
| cert\_full\_chain | n/a |
| cert\_private\_key | n/a |

