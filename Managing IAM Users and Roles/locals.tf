# ============================================================
# USER CONFIGURATION
# ============================================================
# Reads the users and their assigned roles from users.yaml.
#
# yamldecode() converts the YAML file into Terraform data
# that can be referenced throughout the configuration.

locals {
  users = yamldecode(file("${path.module}/users.yaml"))

  users_by_name = {
    for user in local.users.users :
    user.username => user
  }
}