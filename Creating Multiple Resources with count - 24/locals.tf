locals {
  # Store the project name in one place so it can be reused
  # across the VPC and subnet resources.
  project = "11-multiple-resources"
}

# ============================================================
# AMI ID MAP
# ============================================================
# Maps friendly AMI names used in our instance configuration
# to the actual AMI IDs returned by our data sources.
#
# This allows terraform.tfvars to use values such as
# "ubuntu" or "nginx" instead of hard-coded AMI IDs.

locals {
  ami_ids = {
    ubuntu = data.aws_ami.ubuntu.id
    nginx  = data.aws_ami.ubuntu.id
  }
}