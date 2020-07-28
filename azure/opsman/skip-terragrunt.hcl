

dependency "paving" {
  config_path = "../paving"
}

dependency "letsencrypt" {
  config_path = "../letsencrypt"
}

inputs {
  environment_name = dependency.paving.outputs.environment_name
  hosted_zone = dependency.paving.outputs.hosted_zone
  cert_full_chain = dependency.letsencrypt.outputs.cert_full_chain
  cert_private_key = dependency.letsencrypt.outputs.cert_private_key
}