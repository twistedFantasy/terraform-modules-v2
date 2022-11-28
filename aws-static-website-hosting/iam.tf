resource "aws_iam_user" "aws_iam_user" {
  count = var.create_iam_user ? 1 : 0

  name = local.bucket_name

  tags = local.common_tags
}

resource "aws_iam_access_key" "aws_iam_access_key" {
  count = var.create_iam_user ? 1 : 0

  user = aws_iam_user.aws_iam_user[0].name
}

resource "aws_iam_user_policy" "aws_iam_user_policy" { # FIXME: add cache invalidation policy for CloudFront if needed
  count = var.create_iam_user ? 1 : 0

  name = local.bucket_name
  user = aws_iam_user.aws_iam_user[0].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:*"]
        Resource = [
          module.aws_s3.s3_bucket_arn,
          "${module.aws_s3.s3_bucket_arn}/*"
        ]
      }
    ]
  })
}
