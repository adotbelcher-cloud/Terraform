# ============================================================
# IAM USER TEMPORARY PASSWORDS
# ============================================================
# Outputs the temporary console password generated for each
# IAM user.
#
# Users are required to reset their password on first login.

output "user_temporary_passwords" {
  value = {
    for username, profile in aws_iam_user_login_profile.users :
    username => profile.password
  }
  sensitive = true
}