resource "tfe_project" "compute" {
  organization = tfe_organization.aws.name
  name         = "compute"
}