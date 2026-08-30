data "aws_ami" "ubuntu" {
  # Select the most recent matching Ubuntu AMI.
  most_recent = true

  # Canonical is the owner of the official Ubuntu AMIs.
  owners = ["099720109477"]

  filter {
    # Match Ubuntu 22.04 AMD64 server images.
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    # Ensure the AMI uses HVM virtualization.
    name   = "virtualization-type"
    values = ["hvm"]
  }
}