variable "project" {
  type        = string
  description = "The id of the project in Gitlab."
}

variable "project_variables" {
  type = map(object({
    value     = any
    protected = bool
    masked    = bool
  }))
  description = "Variables store information, like passwords and secret keys, that you can use in job scripts."
  default     = {}
}
