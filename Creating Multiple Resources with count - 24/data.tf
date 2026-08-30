# ============================================================
# AMI DATA SOURCES
# ============================================================
# Data sources allow Terraform to look up existing AWS
# resources without creating them.
#
# We use an AMI data source instead of hard-coding an AMI ID.
# This allows Terraform to find the appropriate image
# automatically for the current AWS region.


# ============================================================
# UBUNTU AMI
# ============================================================
# Looks up the most recent Ubuntu 22.04 AMD64 server AMI
# published by Canonical.
#
# The resulting AMI ID is available through:
# data.aws_ami.ubuntu.id
#
# Other parts of the configuration can reference this AMI
# through the local.ami_ids map instead of using the AMI ID
# directly.

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    # Match Ubuntu 22.04 AMD64 server images.
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    # Only select AMIs using HVM virtualization.
    name   = "virtualization-type"
    values = ["hvm"]
  }
}