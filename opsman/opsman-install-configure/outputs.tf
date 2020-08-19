# ==================== Outputs
output "opsman_password" {
  value = var.opsman_password
  sensitive = true
}

output "ops_manager_ssh_private_key" {
  value = var.ops_manager_ssh_private_key
}

output "ops_manager_dns" {
  value = var.ops_manager_dns
}
