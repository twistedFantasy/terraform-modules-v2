data "aws_iam_policy_document" "cloudfront_bucket_policy" {
  count = var.create_cloudfront ? 1 : 0

  dynamic "statement" {
    for_each = [{ type = "AWS", identifiers = [module.aws_cloudfront[0].cloudfront_origin_access_identity_iam_arns[0]] }]

    content {
      principals {
        type        = statement.value["type"]
        identifiers = statement.value["identifiers"]
      }

      actions = [
        "s3:GetObject",
      ]

      resources = [
        "arn:aws:s3:::${local.bucket_name}/*",
      ]
    }
  }
}
