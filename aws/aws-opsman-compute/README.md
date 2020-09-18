# What is this?
Creates OpsMan VM on AWS.

## How do I use this? 
Best to use it with [Terragrunt](https://terragrunt.gruntwork.io/). 


## Requirements

The following requirements are needed by this module:

- terraform (>= 0.12.0)

- aws (~> 2.0)

- random (~> 2.2)

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

Description: Name of the environment. This is used for naming compute resource.

Type: `string`

### ops\_manager\_dns

Description: OpsMan DNS name. Output from https://github.com/pivotal/paving/aws

Type: `any`

### ops\_manager\_iam\_instance\_profile\_name

Description: Output from https://github.com/pivotal/paving/aws

Type: `any`

### ops\_manager\_public\_ip

Description: Public IP of OpsMan

Type: `any`

### ops\_manager\_security\_group\_id

Description: Output from https://github.com/pivotal/paving/aws

Type: `any`

### ops\_manager\_ssh\_private\_key

Description: n/a

Type: `string`

### ops\_manager\_ssh\_public\_key

Description: n/a

Type: `string`

### opsman\_build

Description: n/a

Type: `string`

### opsman\_version

Description: n/a

Type: `string`

### public\_subnet\_ids

Description: Output from https://github.com/pivotal/paving/aws

Type: `list(string)`

### region

Description: AWS Region

Type: `string`

### secret\_key

Description: AWS secret key

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### ops\_manager\_instance\_type

Description: n/a

Type: `string`

Default: `"r4.large"`

### tags

Description: Tags to apply to resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### ops\_manager\_dns

Description: n/a

### ops\_manager\_ssh\_private\_key

Description: n/a

