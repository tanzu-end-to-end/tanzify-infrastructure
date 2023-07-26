# ==================== Output

output "cert_full_chain" {
  value = local.cert_full_chain
}
output "cert_ca" {
  value = local.cert_ca
}

output "cert_private_key" {
  value = local.cert_key
  sensitive = true
}
