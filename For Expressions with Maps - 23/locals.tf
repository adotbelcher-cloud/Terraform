locals {
  # Create a new map with the same keys as numbers_map,
  # but double each value.
  doubles_map = {
    for key, value in var.numbers_map : key => value * 2
  }

  # Create a new map containing only even values,
  # then double those values.
  even_map = {
    for key, value in var.numbers_map : key =>
    value * 2 if value % 2 == 0
  }

  # Convert the users list into a map where the username
  # becomes the key and the role becomes the value.
  # The ... groups roles together when a username appears more than once.
  users_map = {
    for user_info in var.users : user_info.username => user_info.role...
  }

  # Convert users_map into a map where each username
  # maps to an object containing a roles list.
  users_map2 = {
    for username, roles in local.users_map : username => {
      roles = roles
    }
  }

usernames_from_map = [
  for username, roles in local.users_map : upper(username)
]

# Convert users_map into a list containing only the usernames.
# Alternatively, use Terraform's built-in keys() function. comment out line 30-32
# usernames_from_map = keys(local.users_map)

}