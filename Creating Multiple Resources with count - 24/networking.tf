# ============================================================
# NETWORKING
# ============================================================
# Creates the basic AWS networking infrastructure for this
# project:
#
# VPC
# └── Multiple subnets
#
# Subnets are created dynamically using the subnet_config map.
# Each map key identifies a subnet and each object provides
# its CIDR block.


# ============================================================
# VPC
# ============================================================
# Creates the project's VPC using a /16 CIDR block.
#
# The local.project value is used for both tags so the
# resources can be easily identified in AWS.

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Project = local.project
    Name    = local.project
  }
}


# ============================================================
# SUBNETS
# ============================================================
# Creates one subnet for each entry in var.subnet_config.
#
# The map key becomes the subnet identifier.
#
# Example:
#
# default = {
#   cidr_block = "10.0.0.0/24"
# }
#
# subnet_1 = {
#   cidr_block = "10.0.1.0/24"
# }

resource "aws_subnet" "main" {
  for_each   = var.subnet_config
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block

  tags = {
    Project = local.project
    Name    = "${local.project}-${each.key}"
  }
}