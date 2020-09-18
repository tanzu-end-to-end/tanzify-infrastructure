# What is this?
Paves Network for Harbor on AWS.

## How do I use this? 
Best to use it with [Terragrunt](https://terragrunt.gruntwork.io/). 


## Requirements

The following requirements are needed by this module:

- terraform (>= 0.12.0)

- aws (~> 2.0)

- tls (~> 2.1)

## Providers

The following providers are used by this module:

- aws (~> 2.0)

## Required Inputs

The following input variables are required:

### access\_key

Description: AWS Access Key

Type: `string`

### environment\_name

Description: Name of the environment. This is prefixed with the hosted\_zone DNS to register harbor with DNS.

Type: `string`

### hosted\_zone

Description: DNS  name (e.g. foo.example.com) that is registered with Route53

Type: `string`

### public\_subnet\_ids

Description: n/a

Type: `list(string)`

### region

Description: AWS Region

Type: `string`

### secret\_key

Description: AWS secret key

Type: `string`

### vpc\_id

Description: VPC Id

Type: `any`

## Optional Inputs

The following input variables are optional (have default values):

### tags

Description: Key/value tags to assign to resources.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### harbor\_domain

Description: n/a

### harbor\_lb\_security\_group\_id

Description: n/a

### harbor\_web\_lb\_name

Description: n/a

