
variable "stable_config" {}
output  "paving_config" {
  value = {
    location = jsondecode(var.stable_config).location
    hosted_zone = jsondecode(var.stable_config).hosted_zone
    environment_name = jsondecode(var.stable_config).environment_name
  }
}
