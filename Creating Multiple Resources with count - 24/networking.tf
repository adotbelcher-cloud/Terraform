# ============================================================
# NETWORKING
# ============================================================
# Creates the basic AWS networking infrastructure for this
# project:
#
# VPC
# └── Multiple subnets
#
# The subnet count and CIDR blocks are generated dynamically
# using the count meta-argument.


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
# Creates multiple subnets inside the VPC.
#
# The number of subnets is controlled by var.subnet_count.
# For example:
#
# subnet_count = 2
#   → aws_subnet.main[0]
#   → aws_subnet.main[1]
#
# count.index provides the index of each subnet and is used
# to generate unique CIDR blocks and resource names.

resource "aws_subnet" "main" {
  count = var.subnet_count

  vpc_id = aws_vpc.main.id

  # Generate a unique /24 CIDR block for each subnet.
  #
  # [0] → 10.0.0.0/24
  # [1] → 10.0.1.0/24
  # [2] → 10.0.2.0/24

  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Project = local.project
    Name    = "${local.project}-${count.index}"
  }
}