

dependency "creds" {
  config_path = "../letsencrypt"
}


terraform {
  # Terraform azure for PAS and TKGI using paving repo
  source = "git::git@github.com:pivotal/paving.git//azure"
}


inputs = {
  subscription_id = dependency.creds.outputs.azure_subscription_id
  tenant_id = dependency.creds.outputs.azure_tenant_id
  client_id = dependency.creds.outputs.azure_client_id
  client_secret = dependency.creds.outputs.azure_client_secret
  environment_name = "demo" # This will be used to append to dns entries.
  location = "South Central US"
  hosted_zone = "azure.pcf-arau.pw"
}