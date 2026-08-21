output "bucket_name" {
  value = aws_s3_bucket.s3_bucket.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.s3_website.website_endpoint
}