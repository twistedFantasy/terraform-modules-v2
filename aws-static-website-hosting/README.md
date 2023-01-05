<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_cloudfront"></a> [aws\_cloudfront](#module\_aws\_cloudfront) | terraform-aws-modules/cloudfront/aws | 3.0.3 |
| <a name="module_aws_s3"></a> [aws\_s3](#module\_aws\_s3) | terraform-aws-modules/s3-bucket/aws | 3.5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.aws_iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.aws_iam_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_policy_document.cloudfront_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Custom bucket name which override default value. | `string` | `null` | no |
| <a name="input_cloudfront_acm_certificate_arn"></a> [cloudfront\_acm\_certificate\_arn](#input\_cloudfront\_acm\_certificate\_arn) | The ARN of existing certificate created by AWS Certificate Manager. | `string` | `null` | no |
| <a name="input_cloudfront_default_root_object"></a> [cloudfront\_default\_root\_object](#input\_cloudfront\_default\_root\_object) | AWS CloudFront default root object. | `string` | `"index.html"` | no |
| <a name="input_cloudfront_viewer_protocol_policy"></a> [cloudfront\_viewer\_protocol\_policy](#input\_cloudfront\_viewer\_protocol\_policy) | Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https | `string` | `"allow-all"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags added to all supported resources. | `map(any)` | `{}` | no |
| <a name="input_create_cloudfront"></a> [create\_cloudfront](#input\_create\_cloudfront) | If we want to create an AWS CloudFront. | `bool` | `false` | no |
| <a name="input_create_iam_user"></a> [create\_iam\_user](#input\_create\_iam\_user) | n/a | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment; a short code like 'dev' or 'live-eu'. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name. | `string` | n/a | yes |
| <a name="input_website"></a> [website](#input\_website) | Map containing static web-site hosting or redirect configuration. | `any` | <pre>{<br>  "error_document": "index.html",<br>  "index_document": "index.html"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_arn"></a> [cloudfront\_distribution\_arn](#output\_cloudfront\_distribution\_arn) | n/a |
| <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name) | n/a |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | n/a |
| <a name="output_iam_user_access_key_id"></a> [iam\_user\_access\_key\_id](#output\_iam\_user\_access\_key\_id) | n/a |
| <a name="output_iam_user_name"></a> [iam\_user\_name](#output\_iam\_user\_name) | n/a |
| <a name="output_iam_user_secret_access_key"></a> [iam\_user\_secret\_access\_key](#output\_iam\_user\_secret\_access\_key) | n/a |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_bucket_domain_name"></a> [s3\_bucket\_bucket\_domain\_name](#output\_s3\_bucket\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_s3_bucket_bucket_regional_domain_name"></a> [s3\_bucket\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. The bucket domain name including the region name. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The name of the bucket. |
| <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region) | The AWS region this bucket resides in. |
| <a name="output_s3_bucket_website_domain"></a> [s3\_bucket\_website\_domain](#output\_s3\_bucket\_website\_domain) | The domain of the website endpoint. This is used to create Route 53 alias records. |
| <a name="output_s3_bucket_website_endpoint"></a> [s3\_bucket\_website\_endpoint](#output\_s3\_bucket\_website\_endpoint) | The domain of the website endpoint. |
<!-- END_TF_DOCS -->
