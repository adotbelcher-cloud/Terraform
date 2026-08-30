locals {
  # Store the project name in one place so it can be reused
  # across the VPC and subnet resources.
  project = "11-multiple-resources"
}

variable "subnet_count" {
  # Number of subnets Terraform should create.
  type = number

  # Create two subnets by default.
  default = 4
}