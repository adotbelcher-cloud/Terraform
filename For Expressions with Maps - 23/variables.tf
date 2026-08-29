variable "numbers_map" {
  type = map(number)
}

variable "users" {
  type = list(object({
    username = string
    role     = string
  }))
}

variable "user_to_output" {
  type = string
}

