module "aws_s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.5.0"

  bucket                  = local.bucket_name
  website                 = var.website
  block_public_acls       = var.create_cloudfront ? true : false
  block_public_policy     = var.create_cloudfront ? true : false
  ignore_public_acls      = var.create_cloudfront ? true : false
  restrict_public_buckets = var.create_cloudfront ? true : false

  attach_policy                         = true
  policy                                = var.create_cloudfront ? data.aws_iam_policy_document.cloudfront_bucket_policy[0].json : local.public_read_policy


  tags = local.common_tags
}
