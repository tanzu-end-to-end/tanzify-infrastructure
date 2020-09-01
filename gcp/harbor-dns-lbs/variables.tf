

variable "region" {
}

variable "service_account_key" {

}
variable "project" {

}

variable "environment_name" {
  type = string
}

variable "hosted_zone" {
  description = "The name of the Google Cloud DNS zone that managed the domain specified for dns_suffix"
  type        = string
}

variable "network_name" {

}
