# ============================================================
# EC2 INSTANCES — count
# ============================================================
# Creates EC2 instances based on the value of
# var.ec2_instance_count.
#
# count.index provides a zero-based index for each instance,
# which is used to:
# - Give each instance a unique name.
# - Select a subnet using the modulo operator.
#
# The Ubuntu AMI is retrieved from the aws_ami.ubuntu
# data source.
#
# This resource is kept from the previous exercise so we
# can compare the count approach with the list approach below.

resource "aws_instance" "from_count" {
  count = var.ec2_instance_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  # Cycle through the available subnets.
  # Example with 2 subnets:
  # instance 0 → subnet 0
  # instance 1 → subnet 1
  # instance 2 → subnet 0
  # instance 3 → subnet 1
  subnet_id = aws_subnet.main[
    count.index % length(aws_subnet.main)
  ].id

  tags = {
    Name    = "${local.project}-${count.index}"
    Project = local.project
  }
}


# ============================================================
# EC2 INSTANCES — list configuration
# ============================================================
# Creates one EC2 instance for each object in
# var.ec2_instance_config_list.
#
# Each object specifies:
# - instance_type → The EC2 instance type to use.
# - ami          → A friendly AMI name such as "ubuntu".
#
# The friendly AMI name is converted into an actual AMI ID
# using the local.ami_ids map.
#
# This approach allows us to add or modify EC2 instances by
# changing the variable configuration instead of modifying
# this resource.
#
# The instances are distributed across the available subnets
# using count.index and the modulo operator.

resource "aws_instance" "from_list" {
  # Creates one EC2 instance for each configuration
  # object in ec2_instance_config_list.

  count         = length(var.ec2_instance_config_list)
  ami           = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  instance_type = var.ec2_instance_config_list[count.index].instance_type
  subnet_id = aws_subnet.main[
    var.ec2_instance_config_list[count.index].subnet_name
  ].id

  tags = {
    Name    = "${local.project}-${count.index}"
    Project = local.project
  }
}

# ============================================================
# EC2 INSTANCES FROM MAP
# ============================================================
# Creates one EC2 instance for each entry in
# var.ec2_instance_config_map.
#
# for_each uses the map keys as stable resource identifiers.
# Each instance gets its AMI and instance type from its
# corresponding configuration object.
#
# Example resource addresses:
# aws_instance.from_map["ubuntu_1"]
# aws_instance.from_map["nginx_1"]

resource "aws_instance" "from_map" {
  # Creates one EC2 instance for each entry
  # in ec2_instance_config_map.

  for_each      = var.ec2_instance_config_map
  ami           = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.main[each.value.subnet_name].id

  tags = {
    Name    = "${local.project}-${each.key}"
    Project = local.project
  }
}