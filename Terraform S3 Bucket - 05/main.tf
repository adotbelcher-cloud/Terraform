# Terraform configuration
# Defines the Terraform version and the providers required
# to build this project's infrastructure.

terraform {
  required_version = "~> 1.7"
  required_providers {

    # AWS provider: used to create and manage AWS resources.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    # Random provider: used to generate a unique value
    # for the S3 bucket name.
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# AWS provider configuration
# Specifies the AWS region where Terraform will create resources.
provider "aws" {
  region = "us-east-1"

}

# Random ID resource
# Generates a unique hexadecimal value that will be used
# as part of the S3 bucket name.
# Generate 6 random bytes for the ID.
resource "random_id" "bucket_suffix" {
  byte_length = 6
}

# S3 bucket resource
# Creates an Amazon S3 bucket whose name includes the random ID
# generated above to ensure the bucket name is globally unique.
resource "aws_s3_bucket" "aaron_terraform_s3" {
  bucket = "aaron-terraform-s3-${random_id.bucket_suffix.hex}"

}

# Output
# Displays the actual name of the S3 bucket after creation.
output "bucket_name" {
  value = aws_s3_bucket.aaron_terraform_s3.bucket
}