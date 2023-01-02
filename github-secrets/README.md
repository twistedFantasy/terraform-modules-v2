<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository"></a> [repository](#input\_repository) | n/a | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
