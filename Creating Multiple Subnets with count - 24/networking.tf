resource "aws_vpc" "main" {
  # Create a VPC with a /16 CIDR block.
  cidr_block = "10.0.0.0/16"

  tags = {
    # Use the local project name for consistent resource tagging.
    Project = local.project
    Name    = local.project
  }
}

resource "aws_subnet" "main" {
# Use the input variable so the number of subnets can be changed
# without modifying the resource configuration.
count = var.subnet_count

  # Attach every subnet to the VPC created above.
  vpc_id = aws_vpc.main.id

  # Use count.index to generate a unique /24 network for each subnet.
  # [0] becomes 10.0.0.0/24 and [1] becomes 10.0.1.0/24.
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    # Apply the shared project tag to every subnet.
    Project = local.project

    # count.index identifies the individual subnet:
    # 0 for the first subnet, 1 for the second.
    Name = "${local.project}-${count.index}"
  }
}