identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

store "varset" "openshift_rosa" {
  id       = "varset-apTRx2kP23J4itNy"
  category = "terraform"
}


deployment "openshift_rosa_dev" {
  inputs = {
    aws_identity_token = identity_token.aws.jwt
    role_arn            = "arn:aws:iam::804453558652:role/tfstacks-role"
    region             = "ap-southeast-2"
    rhcs_token        = store.varset.openshift_rosa.rhcs_token
    cluster_admin_password = store.varset.openshift_rosa.clusterpass
    aws_billing_account_id = "804453558652"
    cidr_block          = "10.0.0.0/16"
    public_subnets      = []
    private_subnets     = ["subnet-069afa1cba0850810","subnet-0fb4f973fae8f620d"]
    availability_zones  = ["ap-southeast-2a", "ap-southeast-2b"]
    cluster_name        = "rosa-dev-cluster"
    openshift_version   = "4.18.9"
    account_role_prefix = "ManagedOpenShift"
    operator_role_prefix = "ManagedOpenShift"
    replicas           = 1
    htpasswd_idp_name   = "dev-htpasswd"
    htpasswd_username   = "cluster-admin" 
    tfc_organization_name = "butterflyswim"

  }
}


orchestrate "auto_approve" "safe_plans_dev" {
  check {
      # Only auto-approve in the development environment if no resources are being removed
      condition = context.plan.changes.remove == 0 && context.plan.deployment == deployment.openshift_rosa_dev
      reason = "Plan has ${context.plan.changes.remove} resources to be removed."
  }
}