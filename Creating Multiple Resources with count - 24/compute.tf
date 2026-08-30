resource "aws_instance" "from_count" {
  # Create the number of EC2 instances specified by the variable.
  count = var.ec2_instance_count

  # Use the Ubuntu AMI returned by the data source.
  ami = data.aws_ami.ubuntu.id

  # Use a small instance type for this exercise.
  instance_type = "t3.micro"

  # Distribute EC2 instances across the available subnets.
  # The modulo operator (%) cycles through the subnet indexes.
  subnet_id = aws_subnet.main[
    count.index % length(aws_subnet.main)
  ].id

  tags = {
    # Use count.index to give each EC2 instance a unique name.
    Name = "${local.project}-${count.index}"

    # Apply the shared project tag.
    Project = local.project
  }
}