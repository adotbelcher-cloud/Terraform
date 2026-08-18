# This module demonstrates how Terraform can include reusable
# configuration from another directory.
#
# The module-example directory is intentionally not included
# because this exercise is focused on learning HCL syntax
# rather than deploying the configuration.
#
# module "my_module" {
#   source = "./module-example"
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# actively managed by us, the terraform project
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Data source:
# Retrieves information about infrastructure managed outside
# of this Terraform configuration.
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

# Variable:
# Allows values to be supplied/configured rather than hard-coded.
variable "bucket_name" {
  type        = string
  description = "My variable used to set bucket name"
  default     = "my_default_bucket_name"
}

# Output:
# Exposes information from the Terraform configuration.
output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

# Locals:
# Defines reusable values available only within this Terraform project.
locals {
  local_example = "This is a local variable"
}

# Module:
# Modules allow reusable Terraform configurations to be included
# in a project.
#
# This is intentionally commented out because the module-example
# directory is not provided for this syntax-only exercise.
# module "my_module" {
#  source = "./module-example"
#}