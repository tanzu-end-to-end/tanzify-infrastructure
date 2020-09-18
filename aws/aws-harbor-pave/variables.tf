variable "region" {
  type = string
  description = "AWS Region"
}
variable "secret_key" {
  type = string
  description = "AWS secret key"
}
variable "access_key" {
  type = string
  description = "AWS Access Key"

}
variable "environment_name" {
  type = string
  description = "Name of the environment. This is prefixed with the hosted_zone DNS to register harbor with DNS."
}


variable "tags" {
  description = "Key/value tags to assign to resources."
  default     = {}
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC Id"

}
variable "public_subnet_ids" {
  type = list(string)
}


variable "hosted_zone" {
  description = "DNS  name (e.g. foo.example.com) that is registered with Route53"
  type        = string
}