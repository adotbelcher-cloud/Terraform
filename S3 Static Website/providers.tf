terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.60"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.5"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}