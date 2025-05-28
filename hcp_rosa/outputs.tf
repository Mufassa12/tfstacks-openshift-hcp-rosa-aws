output "cluster_id" {
  description = "ID of the created ROSA HCP cluster"
  value       = module.hcp.cluster_id
}

output "cluster_domain" {
  description = "Domain name of the ROSA HCP cluster"
  value       = module.hcp.cluster_domain
}

output "cluster_admin_username" {
  value       = nonsensitive(module.hcp.cluster_admin_username)
  description = "The username of the admin user."
  sensitive   = false
}

output "cluster_oauth_url" {
  description = "URL for the OpenShift OAuth endpoint"
  value       = data.http.openshift_auth.url
}

output "response_headers" {
  value       = nonsensitive(local.oauth_location)
  description = "Response headers from the OpenShift authentication request"
  sensitive   = false
}

output "cluster_admin_password" {
  value       = nonsensitive(module.hcp.cluster_admin_password)
  description = "The password of the admin user."
  sensitive   = false
}

output "cluster_console_url" {
  description = "URL for the OpenShift web console"
  value       = module.hcp.cluster_console_url
}


output "cluster_api_url" {
  description = "URL for the OpenShift API"
  value       = module.hcp.cluster_api_url
}

output "cluster_state" {
  value       = module.hcp.cluster_state
  description = "The state of the cluster."
}

output "oidc_endpoint_url" {
  description = "URL for the OpenID Connect endpoint"
  value       = module.hcp.oidc_endpoint_url
}

# output "htpasswd_username" {
#   description = "Username for HTPasswd authentication"
#   value       = var.htpasswd_username
# }

# output "htpasswd_password" {
#   description = "Generated password for HTPasswd authentication"
#   value       = random_password.password.result
#   sensitive   = true
# }

output "sts_token" {
  value = nonsensitive(data.aws_eks_cluster_auth.openshift.token)
  description = "STS token for authentication"
  sensitive = false
}

# output "ocm_properties" {
#   value = data.rhcs_cluster_rosa_hcp.cluster.ocm_properties
#   description = "OCM properties for the cluster"
# }


output "auth_result" {
  value = nonsensitive(data.http.openshift_auth.response_body)
  sensitive = false
}

