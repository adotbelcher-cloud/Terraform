# ============================================================
# TERRAFORM CONFIGURATION
# ============================================================
# Defines the Terraform version and AWS provider used by
# this project.
#
# The AWS provider allows Terraform to create and manage
# IAM resources in our AWS account.

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}