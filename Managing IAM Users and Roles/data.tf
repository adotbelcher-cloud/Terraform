# ============================================================
# IAM ROLE TRUST POLICIES
# ============================================================
# Creates a trust policy for each IAM role.
#
# Each policy allows only the IAM users assigned to that role
# to assume it.

data "aws_iam_policy_document" "assume_role" {
  for_each = local.role_config

  statement {
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        for username, user_config in local.users_by_name :
        aws_iam_user.users[username].arn
        if contains(user_config.roles, each.key)
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}