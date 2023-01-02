<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >= 15.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 15.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project_variable.project_variable](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_variable) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | The id of the project in Gitlab. | `string` | n/a | yes |
| <a name="input_project_variables"></a> [project\_variables](#input\_project\_variables) | Variables store information, like passwords and secret keys, that you can use in job scripts. | <pre>map(object({<br>    value     = any<br>    protected = bool<br>    masked    = bool<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
