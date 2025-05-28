variable "region" {
  type = string
}

variable "aws_identity_token" {
  type = string
  ephemeral = true
  sensitive = true
}

variable "role_arn" {
  type = string
}

variable "rhcs_token" {
  type = string
  ephemeral = true
  #sensitive = true
}

variable "aws_billing_account_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "openshift_version" {
  type = string
}

variable "account_role_prefix" {
  type = string
}

variable "operator_role_prefix" {
  type = string
}

variable "replicas" {
  type = number
}

variable "htpasswd_idp_name" {
  type = string
}

variable "htpasswd_username" {
  type = string
}


variable "tfc_organization_name" {
  type = string
  description = "The name of the Terraform Cloud organization"
}

variable "cluster_admin_password" {
  type = string
  ephemeral = true
  description = "The password for the cluster admin user"
}
