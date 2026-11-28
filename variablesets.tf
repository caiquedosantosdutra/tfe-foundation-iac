resource "tfe_variable_set" "aws_creds" {
  name         = "AWS Auth"
  description  = "AWS Auth"
  organization = tfe_organization.aws.name
}

resource "tfe_project_variable_set" "tfe_project_variable_set" {
  project_id      = tfe_project.compute.id
  variable_set_id = tfe_variable_set.aws_creds.id
  
}

resource "tfe_workspace_variable_set" "tfe_workspace_variable_set" {
  workspace_id    = tfe_workspace.nginx-demo-iac.id
  variable_set_id = tfe_variable_set.aws_creds.id
}

resource "tfe_variable" "aws_oidc_auth" {
  key             = "TFC_AWS_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "an environment variable"
  variable_set_id = tfe_variable_set.aws_creds.id
}

resource "tfe_variable" "aws_tfc_role" {
  key             = "TFC_AWS_RUN_ROLE_ARN"
  value           = var.aws_tfc_role
  category        = "env"
  description     = "an environment variable"
  variable_set_id = tfe_variable_set.aws_creds.id
}

resource "tfe_variable" "aws_region" {
  key             = "AWS_REGION"
  value           = var.aws_region
  category        = "env"
  description     = "an environment variable"
  variable_set_id = tfe_variable_set.aws_creds.id
}