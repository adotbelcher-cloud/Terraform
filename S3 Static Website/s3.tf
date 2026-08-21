resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-s3-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "S3 Static website Bucket"
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.s3_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.s3_bucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "s3_website" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "random_id" "bucket_suffix" {
  byte_length = 6
}