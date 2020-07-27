provider "lastpass" {
  version = "~> 0.4.3"
}

variable "azure-servicePrincial-LastPassID" {
  default = ""
  type = string
}

data "lastpass_secret" "azure-ServicePrincipal" {
  id = var.azure-servicePrincial-LastPassID


}
