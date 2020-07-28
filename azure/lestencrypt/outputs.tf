# ==================== Output the

output "cert_full_chain" {
  value = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
  #sensitive = true
}
output "cert_private_key" {
  value = acme_certificate.certificate.private_key_pem
  #sensitive = true
}
