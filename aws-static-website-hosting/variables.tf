variable "project" {
  type        = string
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Name of the environment; a short code like 'dev' or 'live-eu'."
}

variable "bucket_name" {
  type        = string
  description = "Custom bucket name which override default value."
  default     = null
}

variable "website" {
  type        = any
  description = "Map containing static web-site hosting or redirect configuration."
  default = {
    index_document = "index.html"
    error_document = "index.html"
  }
}

variable "create_iam_user" {
  type = bool
  default = true
}

variable "create_cloudfront" {
  type        = bool
  description = "If we want to create an AWS CloudFront."
  default     = false
}

variable "cloudfront_default_root_object" {
  type        = string
  description = "AWS CloudFront default root object."
  default     = "index.html"
}

variable "cloudfront_viewer_protocol_policy" {
  type        = string
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https"
  default     = "allow-all" # FIXME: "redirect-to-https"
}

variable "cloudfront_acm_certificate_arn" {
  type        = string
  description = "The ARN of existing certificate created by AWS Certificate Manager."
  default     = null
}


variable "common_tags" {
  type        = map(any)
  description = "Common tags added to all supported resources."
  default     = {}
}


locals {

  common_tags = merge(
    var.common_tags,
    {
      Terraform = "true"
      Module = "aws-static-website-hosting"
    }
  )

  base_name           = "${var.project}-${var.environment}"
  bucket_name_default = "${local.base_name}-static-website-hosting"
  bucket_name         = var.bucket_name != null ? var.bucket_name : local.bucket_name_default
  bucket_arn          = "arn:aws:s3:::${local.bucket_name}"

  public_read_policy = jsonencode({
     Version = "2012-10-17"
     Statement = [
       {
         Sid = "PublicReadGetObject"
         Effect = "Allow"
         Principal = "*"
         Action = ["s3:GetObject"]
         Resource = [
           "${local.bucket_arn}/*"
         ]
       }
     ]
  })
}
