resource "aws_s3_bucket" "website_bucket" {
  bucket                      = "danielansondotcom"
  bucket_prefix               = null
  force_destroy               = false
  object_lock_enabled         = false
  region                      = "us-west-2"
  tags                        = {
    "env"  = "PROD"
    "name" = "danielanson.com"
  }
}

resource "aws_s3_bucket_ownership_controls" "website_bucket_ownership" {
  bucket = aws_s3_bucket.website_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "website_bucket_acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.website_bucket_ownership ]
  bucket = aws_s3_bucket.website_bucket.id
  acl = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "website_bucket_sse" {
  bucket = aws_s3_bucket.website_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"  
    }
  }
}
