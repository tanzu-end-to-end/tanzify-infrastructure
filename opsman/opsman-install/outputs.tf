# ==================== Outputs
output "ops_manager_password" {
  value = local.opsman_password
  sensitive = true
}

output "ops_manager_dns" {
  value = var.ops_manager_dns
}

output "ops_manager_ssh_private_key" {
  value = var.ops_manager_ssh_private_key
  sensitive = true
}
