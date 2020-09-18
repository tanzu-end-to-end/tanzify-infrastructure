# What is this?
Terraform module to retrieve Secrets from LastPass.

Requires [LastPass CLI](https://github.com/lastpass/lastpass-cli) to be installed and requires exporting LASTPASS_USER and LASTPASS_PASSWORD variables.

```
export LASTPASS_PASSWORD="~/.lpass"
export LASTPASS_USER="<lastpassusername>"
```
Also make sure to be authenticated with the LastPass CLI before running.

## How do I use this? 
Best to use it using [Terragrunt](https://terragrunt.gruntwork.io/). 

## Requirements
The following requirements are needed by this module:

- lastpass (0.5.1)

## Providers

The following providers are used by this module:

- lastpass (0.5.1)

## Required Inputs

The following input variables are required:

### credential-LastPassID

Description: LastPass entry ID where the credentials are stored. To find the ID use the LastPass CLI and run 'lpass ls \| grep <name\_of\_secret>'

Type: `string`

## Optional Inputs

No optional input.

## Outputs

The following outputs are exported:

### id

Description: n/a

