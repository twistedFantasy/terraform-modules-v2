terraform {
  required_version = ">= 1.0.0"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 15.7"
    }
  }
}
