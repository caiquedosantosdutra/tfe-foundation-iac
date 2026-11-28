variable "email" {
    type = string
    description = "Organization email address"
}

variable "tfe_hostname" {
    type = string
    description = "TFE hostname"
}

variable "repository_name" {
    type = string
    description = "Repository to attach in the VCS"
}

variable "branch" {
    type = string
    description = "Repository branch"
    default = "main"
}

variable "oauth_token" {
    type = string
    description = "Github oauth token"
    sensitive = true
}

variable "aws_tfc_role" {
    type = string
}

variable "aws_region" {
    type = string
}