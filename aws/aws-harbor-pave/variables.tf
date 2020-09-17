variable "region" {

}
variable "access_key" {

}
variable "secret_key" {

}

variable "environment_name" {}

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default     = {}
  type        = map(string)
}

variable "vpc_id" {

}
variable "public_subnet_ids" {

}

variable "hosted_zone" {}