terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# default AWS provider
# for resources not with a specific provider
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east"
  region = "us-east-2"
}

resource "random_id" "bucket_suffix" {
  byte_length = 6
}