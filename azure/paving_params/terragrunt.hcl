

dependency "paving" {
  config_path = "../paving"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    location = "fake-vpc-id"
    hosted_zone = "fake-hosted_zone"
    environment_name = "fake-environment_name"
  }

}