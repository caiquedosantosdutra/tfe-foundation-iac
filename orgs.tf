
resource "tfe_organization" "aws" {
  name  = "aws"
  email = var.email
}

resource "tfe_organization" "gcp" {
  name  = "gcp"
  email = var.email
}

resource "tfe_organization" "azr" {
  name  = "azr"
  email = var.email
}