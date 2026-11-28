resource "tfe_oauth_client" "oauth_github" {
  organization     = tfe_organization.aws.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "nginx-demo-iac"{
  name           = "nginx-demo-iac"
  organization   = tfe_organization.aws.name
  project_id = tfe_project.compute.id
  queue_all_runs = false
  vcs_repo {
    branch         = var.branch
    identifier     = var.repository_name
    oauth_token_id = tfe_oauth_client.oauth_github.oauth_token_id
  }
}