


terraform {
  # Terraform azure for PAS and TKGI using paving repo
  source = "git::git@github.com:pivotal/paving.git//azure"
}

dependency "creds" {
  config_path = "./creds"
}

inputs = {
  subscription_id = dependency.creds.outputs.azure_subscription_id
  tenant_id = dependency.creds.outputs.azure_tenant_id
  client_id = dependency.creds.outputs.azure_client_id
  client_secret = dependency.creds.outputs.azure_client_secret
  environment_name = "tkgi"
  location = "South Central US"
  hosted_zone = "azure.pcf-arau.pw"
}