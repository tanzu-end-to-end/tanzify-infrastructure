# What is this?
Creates OpsMan VM on GCP.

## How do I use this? 
Best to use it with [Terragrunt](https://terragrunt.gruntwork.io/). 

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | Requires exactly THREE availability zones that must belong to the provided region. | `list` | n/a | yes |
| environment\_name | Name of the environment. This is prefixed with the hosted\_zone DNS to generate the Common Name for the TLS certificate. | `string` | n/a | yes |
| management\_subnet\_name | Output from https://github.com/pivotal/paving/gcp | `any` | n/a | yes |
| ops\_man\_image\_creation\_timeout | n/a | `string` | `"10m"` | no |
| ops\_manager\_dns | OpsMan DNS name. Output from https://github.com/pivotal/paving/gcp | `any` | n/a | yes |
| ops\_manager\_instance\_type | n/a | `string` | `"n1-standard-2"` | no |
| ops\_manager\_public\_ip | Output from https://github.com/pivotal/paving/gcp | `any` | n/a | yes |
| ops\_manager\_ssh\_private\_key | n/a | `string` | n/a | yes |
| ops\_manager\_ssh\_public\_key | n/a | `string` | n/a | yes |
| opsman\_build | n/a | `string` | n/a | yes |
| opsman\_version | n/a | `string` | n/a | yes |
| project | GCP Project Name | `any` | n/a | yes |
| region | GCP Region | `any` | n/a | yes |
| service\_account\_key | GCP Service Account Key in JSON format | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ops\_manager\_dns | ==================== Outputs |
| ops\_manager\_ssh\_private\_key | n/a |

