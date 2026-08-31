resource "aws_iam_user" "users" {
  for_each = local.users_by_name

  name = each.value.username
}

# ============================================================
# IAM USER LOGIN PROFILES
# ============================================================
# Creates a console login profile for each IAM user.
#
# Terraform will generate a temporary password that can be
# displayed as an output after the resource is created.

resource "aws_iam_user_login_profile" "users" {
  for_each = local.users_by_name

  user                    = aws_iam_user.users[each.key].name
  password_reset_required = true
}