# Find the latest Ubuntu Server 24.04 LTS AMI
# available in the configured AWS region.

# A data source retrieves information about something
# that already exists in AWS rather than creating it.

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# EC2 instance for the initial Ubuntu web server.
# The instance is deployed into the public subnet and
# associated with the NGINX security group.

resource "aws_instance" "nginx_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.custom_public_subnet.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]


  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name    = "terraform-nginx-server"
    project = "terraform-nginx"
    stage   = "initial-ubuntu"
  }
}