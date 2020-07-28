provider "lastpass" {
  version = "~> 0.4.3"
}

variable "azure-servicePrincial-LastPassID" {
  type = string
  description = "LastPass entry ID where the azure credentials are stored"
}

data "lastpass_secret" "azure-ServicePrincipal" {
  id = var.azure-servicePrincial-LastPassID


}
