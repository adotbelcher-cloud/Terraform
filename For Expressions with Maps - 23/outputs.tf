output "doubles_map" {
  value = local.doubles_map
}

output "even_map" {
  value = local.even_map
}

output "users_map" {
  value = local.users_map
}

output "users_map2" {
  value = local.users_map2
}

output "user_to_output_roles" {
  value = local.users_map2[var.user_to_output].roles
}

output "usernames_from_map" {
  value = local.usernames_from_map
}