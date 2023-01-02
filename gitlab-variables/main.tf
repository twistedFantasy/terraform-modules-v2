resource "gitlab_project_variable" "project_variable" {
  for_each  = var.project_variables
  project   = var.project
  key       = each.key
  value     = each.value.value
  protected = each.value.protected
  masked    = each.value.masked
}
