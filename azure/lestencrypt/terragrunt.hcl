
dependency "creds" {
  config_path = "../lastpass"
}

dependency "paving_params" {
  config_path = "../paving_params"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    location = "fake-vpc-id"
    hosted_zone = "fake-hosted_zone"
    environment_name = "fake-environment_name"
  }
}


inputs = {
  subscription_id = dependency.creds.outputs.azure_subscription_id
  tenant_id = dependency.creds.outputs.azure_tenant_id
  client_id = dependency.creds.outputs.azure_client_id
  client_secret = dependency.creds.outputs.azure_client_secret
  environment_name = dependency.paving_params.outputs.environment_name
  hosted_zone = dependency.paving_params.outputs.hosted_zone
}