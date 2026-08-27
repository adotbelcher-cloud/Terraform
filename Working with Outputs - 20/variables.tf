# Define the EC2 instance type with a default value and validation
variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "the type of the managed EC2 instance"

  # Restrict the instance type to supported values
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "The ec2_instance_type variable must be one of: t2.micro, t3.micro."
  }
}

# Define the root volume configuration as an object containing size and type
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

# Allow additional tags to be supplied as a map of key-value pairs
variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to EC2 instances."

}

variable "my_sensitive_value" {
  type        = string
  description = "A sensitive value used for demonstration purposes."
  sensitive   = true
}