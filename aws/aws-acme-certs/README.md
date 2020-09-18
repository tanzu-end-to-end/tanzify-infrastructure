
Generates TLS certificates using LetsEncrypt on AWS.

## Requirements

The following requirements are needed by this module:

- terraform (>= 0.12.0)

- terraform (>= 0.13)

- aws (~> 2.0)

- tls (~> 2.1)

## Providers

The following providers are used by this module:

- acme

- aws (~> 2.0)

- tls (~> 2.1)

## Required Inputs

The following input variables are required:

### access\_key

Description: AWS Access Key

Type: `string`

### environment\_name

Description: Name of the environment. This is prefixed with the hosted\_zone DNS to generate the Common Name for the TLS certificate.

Type: `string`

### hosted\_zone

Description: DNS  name (e.g. foo.example.com) that is registered with Route53

Type: `string`

### region

Description: AWS Region

Type: `string`

### secret\_key

Description: AWS secret key

Type: `string`

### subject\_alternative\_names

Description: SANs to support. Put your wildcard and subdomains here.

Type: `list`

## Optional Inputs

The following input variables are optional (have default values):

### acme\_server\_url

Description: ACME API service endpoint. Points to LetsEncrypt by default.

Type: `string`

Default: `"https://acme-v02.api.letsencrypt.org/directory"`

## Outputs

The following outputs are exported:

### cert\_ca

Description: n/a

### cert\_full\_chain

Description: n/a

### cert\_private\_key

Description: n/a

