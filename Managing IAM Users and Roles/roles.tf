# ============================================================
# IAM ROLES
# ============================================================
# Defines the IAM roles that users can assume.
#
# Role permissions are provided through AWS-managed policies.
#
# Trust policies will restrict which IAM users can assume
# each role.

locals {
  role_config = {
    admin = {
      description = "Administrator role with full access to AWS services."
      policy_arn  = "arn:aws:iam::aws:policy/AdministratorAccess"
    }

    developer = {
      description = "Developer role with limited access to AWS services."
      policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    }
  }
}

# ============================================================
# IAM ROLE POLICY ATTACHMENTS
# ============================================================
# Attaches the AWS-managed policy defined for each role.
#
# Each role receives the policy specified by its policy_arn
# value in local.role_config.

resource "aws_iam_role_policy_attachment" "roles" {
  for_each = local.role_config

  role       = aws_iam_role.roles[each.key].name
  policy_arn = each.value.policy_arn
}


# ============================================================
# IAM ROLE RESOURCES
# ============================================================
# Creates one IAM role for each entry in role_config.
#
# The trust policy is generated separately based on the users
# assigned to each role.

resource "aws_iam_role" "roles" {
  for_each = local.role_config

  name               = each.key
  description        = each.value.description
  assume_role_policy = data.aws_iam_policy_document.assume_role[each.key].json
}