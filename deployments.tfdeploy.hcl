identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

store "varset" "openshift_rosa" {
  id       = "varset-TC8xJVcQjbr7ux9z"
  category = "terraform"
}


deployment "openshift_rosa_dev" {
  inputs = {
    aws_identity_token = identity_token.aws.jwt
    role_arn            = "arn:aws:iam::804453558652:role/tfstacks-role"
    region             = "ap-southeast-1"
    rhcs_token        = store.varset.openshift_rosa.rhcs_token
    cluster_admin_password = store.varset.openshift_rosa.clusterpass
    aws_billing_account_id = "855831148133"
    cidr_block          = "10.200.0.0/16"
    public_subnets      = ["subnet-0c0eca1ee285e4177","subnet-0874f2ae2f9c50df2","subnet-0e88e26f5d4ef35ed"]
    private_subnets = ["subnet-02212f2302fabd834","subnet-08b9377572491efc9","subnet-0ebd436da0b50aa7b"]
    availability_zones  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    cluster_name        = "rosa-dev-cluster"
    openshift_version   = "4.18.9"
    account_role_prefix = "ManagedOpenShift"
    operator_role_prefix = "ManagedOpenShift"
    replicas           = 1
    htpasswd_idp_name   = "dev-htpasswd"
    htpasswd_username   = "cluster-admin" 
    tfc_organization_name = "hashi-demos-apj"

  }
}


orchestrate "auto_approve" "safe_plans_dev" {
  check {
      # Only auto-approve in the development environment if no resources are being removed
      condition = context.plan.changes.remove == 0 && context.plan.deployment == deployment.openshift_rosa_dev
      reason = "Plan has ${context.plan.changes.remove} resources to be removed."
  }
}