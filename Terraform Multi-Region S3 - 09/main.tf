resource "aws_s3_bucket" "us_east_1" {
  bucket = "terraform-multiregion-us-east-1-${random_id.bucket_suffix.hex}"
}

# bucket deployed using alias AWS provider
resource "aws_s3_bucket" "us_east_2" {
  bucket   = "terraform-multiregion-us-east-2-${random_id.bucket_suffix.hex}"
  provider = aws.us-east
}