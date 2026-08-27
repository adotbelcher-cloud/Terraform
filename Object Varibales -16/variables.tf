variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "the type of the managed EC2 instance"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "The ec2_instance_type variable must be one of: t2.micro, t3.micro."
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and type of the root block volume for EC2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to EC2 instances."

}