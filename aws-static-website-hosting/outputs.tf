output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = module.aws_s3.s3_bucket_id
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value = module.aws_s3.s3_bucket_region
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.aws_s3.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.aws_s3.s3_bucket_bucket_domain_name
}

output "s3_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name."
  value = module.aws_s3.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint. This is used to create Route 53 alias records."
  value = module.aws_s3.s3_bucket_website_domain
}

output "s3_bucket_website_endpoint" {
  description = "The domain of the website endpoint."
  value = module.aws_s3.s3_bucket_website_endpoint
}

output "iam_user_name" {
  value = var.create_iam_user ? aws_iam_user.aws_iam_user[0].name : ""
}

output "iam_user_access_key_id" {
  value = var.create_iam_user ?  aws_iam_access_key.aws_iam_access_key[0].id : ""
}

output "iam_user_secret_access_key" {
  sensitive = true
  value     = var.create_iam_user ? aws_iam_access_key.aws_iam_access_key[0].secret : ""
}

output "cloudfront_distribution_arn" {
  value = var.create_cloudfront ? module.aws_cloudfront[0].cloudfront_distribution_arn : ""
}

output "cloudfront_distribution_domain_name" {
  value = var.create_cloudfront ? module.aws_cloudfront[0].cloudfront_distribution_domain_name : ""
}

output "cloudfront_distribution_id" {
  value = var.create_cloudfront ? module.aws_cloudfront[0].cloudfront_distribution_id : ""
}
