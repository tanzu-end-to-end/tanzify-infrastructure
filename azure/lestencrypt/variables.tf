# ==================== Variables



variable "hosted_zone" {
  description = "Hosted zone name (e.g. foo.example.com)"
  type        = string
}

variable "environment_name" {
  description = "This will appended to the DNS to create certificates"
  type        = string
}

variable "subscription_id" {}

variable "tenant_id" {}

variable "client_id" {}

variable "client_secret" {}






