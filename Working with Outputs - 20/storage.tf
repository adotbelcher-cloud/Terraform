# Generate a random suffix to ensure the S3 bucket name is globally unique
resource "random_id" "project_bucket_suffix" {
  byte_length = 4
}

# Create an S3 bucket using the project local and apply the common tags
resource "aws_s3_bucket" "project_bucket" {
  bucket = "${local.project}-${random_id.project_bucket_suffix.hex}"

  tags = merge(local.common_tags, var.additional_tags)
}