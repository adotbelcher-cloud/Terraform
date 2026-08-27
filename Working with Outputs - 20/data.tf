# Retrieve the most recent Ubuntu 24.04 AMI published by Canonical
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  # Filter for Ubuntu 24.04 AMD64 server images using GP3 storage
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  # Only return AMIs using Hardware Virtual Machine (HVM) virtualization
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}