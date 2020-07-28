output "azure_subscription_id" {
  value = data.lastpass_secret.azure-ServicePrincipal.custom_fields.subscription_id
}

output "azure_client_id" {
  value = data.lastpass_secret.azure-ServicePrincipal.custom_fields.client_id
}
output "azure_client_secret" {
  value = data.lastpass_secret.azure-ServicePrincipal.custom_fields.client_secret
  sensitive = true
}
output "azure_tenant_id" {
  value = data.lastpass_secret.azure-ServicePrincipal.custom_fields.tenant_id
}
