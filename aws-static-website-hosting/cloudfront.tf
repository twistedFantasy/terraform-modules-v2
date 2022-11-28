module "aws_cloudfront" {
  count = var.create_cloudfront ? 1 : 0

  source  = "terraform-aws-modules/cloudfront/aws"
  version = "3.0.3"
  aliases             = [] # FIXME: support aliases
  default_root_object = var.cloudfront_default_root_object

  default_cache_behavior = {
    target_origin_id       = module.aws_s3.s3_bucket_id
    viewer_protocol_policy = var.cloudfront_viewer_protocol_policy

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true

    min_ttl     = 0
    max_ttl     = 31536000
    default_ttl = 86400
  }

  viewer_certificate = var.cloudfront_acm_certificate_arn != null ? {
    acm_certificate_arn = var.cloudfront_acm_certificate_arn,
    ssl_support_method  = "sni-only",
    } : {
    cloudfront_default_certificate = true,
    minimum_protocol_version       = "TLSv1",
  }

  origin = {
    "${local.bucket_name}" = {
      domain_name = module.aws_s3.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "${local.base_name}-private"
      }
    }
  }

  create_origin_access_identity = true
  origin_access_identities      = { "${local.base_name}-private" = "${local.base_name}-private" }

  custom_error_response = [
    {
      error_code            = "403",
      response_code         = "200",
      response_page_path    = "/${var.cloudfront_default_root_object}",
      error_caching_min_ttl = 10
    }
  ]

    tags = local.common_tags
}
