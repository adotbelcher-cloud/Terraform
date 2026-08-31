# ============================================================
# INPUT VARIABLES
# ============================================================
# Input variables allow values to be changed without modifying
# the main resource configuration.
#
# This project uses variables to control:
#
# - The number of subnets
# - The number of EC2 instances created with count
# - The configuration of EC2 instances created from a list


# ============================================================
# SUBNET COUNT
# ============================================================
# Controls how many subnets Terraform creates.
#
# Changing this value changes the number of
# aws_subnet.main resources without modifying networking.tf.

variable "subnet_count" {
  type    = number
  default = 2
}


# ============================================================
# EC2 INSTANCE COUNT
# ============================================================
# Controls how many EC2 instances are created by the
# aws_instance.from_count resource.
#
# This demonstrates using a variable with the count
# meta-argument.

variable "ec2_instance_count" {
  type    = number
  default = 1
}


# ============================================================
# EC2 INSTANCE CONFIGURATION LIST
# ============================================================
# Defines the configuration for EC2 instances created by
# aws_instance.from_list.
#
# Each object in the list represents one EC2 instance and
# specifies:
#
# - instance_type → The EC2 instance type to use
# - ami           → A friendly AMI name such as "ubuntu"
#
# The list can contain any number of instance configurations.
#
# Example:
#
# [
#   {
#     instance_type = "t3.micro"
#     ami           = "ubuntu"
#   },
#   {
#     instance_type = "t3.micro"
#     ami           = "nginx"
#   }
# ]

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
  }))

  # No list-based instances are created unless configurations
  # are provided through a .tfvars file.

  default = []

  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list :
      contains(["t3.micro"], config.instance_type)
    ])

    error_message = "Only t3.micro instances are allowed."
  }

  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list :
      contains(["nginx", "ubuntu"], config.ami)
    ])

    error_message = "At least one of the provided \"ami\" values is not supported.\nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }
}