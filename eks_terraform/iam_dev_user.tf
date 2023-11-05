module "devuser_iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.3.1"

  name                          = "devuser1"
  create_iam_access_key         = false
  create_iam_user_login_profile = false

  force_destroy = true
}
