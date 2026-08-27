# # Create an EC2 instance using the AMI retrieved by the data source
# resource "aws_instance" "compute" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.ec2_instance_type

#   # Configure the root EBS volume using values from the volume configuration object
#   root_block_device {
#     delete_on_termination = true
#     volume_size           = var.ec2_volume_config.size
#     volume_type           = var.ec2_volume_config.type
#   }

#   # Merge common project tags with any additional tags provided as input variables
#   tags = merge(local.common_tags, var.additional_tags)
# }