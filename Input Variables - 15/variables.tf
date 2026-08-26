variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "the type of the managed EC2 instance"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "The ec2_instance_type variable must be one of: t2.micro, t3.micro."
  }
}

variable "ec2_volume_type" {
  type        = string
  default     = "gp3"
  description = "the type of the managed EC2 volume"

  validation {
    condition     = contains(["gp2", "gp3"], var.ec2_volume_type)
    error_message = "The ec2_volume_type variable must be one of: gp2, gp3."
  }
}

variable "ec2_volume_size" {
  type        = number
  default     = 10
  description = "the size of the managed EC2 volume in GB"

  validation {
    condition     = var.ec2_volume_size >= 8 && var.ec2_volume_size <= 100
    error_message = "The ec2_volume_size variable must be between 8 and 100 GB."
  }
}