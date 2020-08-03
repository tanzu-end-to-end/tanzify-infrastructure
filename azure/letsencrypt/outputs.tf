# ==================== Output the

output "cert_full_chain" {
  value = local.cert_full_chain
  sensitive = true
}
output "cert_private_key" {
  value = local.cert_key
  sensitive = true
}
