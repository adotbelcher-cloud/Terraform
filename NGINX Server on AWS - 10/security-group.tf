# Security group for the NGINX web server.
# Allows inbound HTTP and HTTPS traffic from the internet.
# Outbound traffic is allowed so the instance can communicate
# with external services when needed.

resource "aws_security_group" "nginx_sg" {
  name        = "nginx-security-group"
  description = "allow inbound HTTP and HTTPS trafic from the internet"
  vpc_id      = aws_vpc.custom_vpc.id

  # allow HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow HTTPS traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "nginx-security-group"
    project = "terraform-nginx"
  }
}