terraform {
  required_providers {
    http = {
      source  = "local/terraform-providers/http"
      version = "~> 1.0"
    }
  }

  required_version = ">= 1.11.0"
}

variable "host" {
  description = "The host of the Kubernetes cluster"
  type        = string
}

provider "kubernetes" {
    host     = var.host
    token = local.access_token
}

data "kubernetes_all_namespaces" "allns" {}


locals {
  oauth_cred = base64encode("cluster-admin:ZoGBF-uY3rm-56Mrh-yHFLt")


  # Extract everything after #access_token= and before the next &
  access_token = regex("access_token=([^&]*)", data.http.openshift_auth.response_headers["Location"])[0]

}


data "http" "openshift_auth" {
  depends_on       = [local.oauth_cred]
  url              = "https://oauth.e4t1w3t5o7q5r6j.v9wp.p3.openshiftapps.com/oauth/authorize?client_id=openshift-challenging-client&response_type=token"
  method           = "HEAD"
  insecure         = true
  follow_redirects = false

  # base64 encoded
  request_headers = {
    Authorization = "Basic ${local.oauth_cred}"
    X-CSRF-Token  = "xxx"
    Content-Type  = "application/x-www-form-urlencoded"
  }
}

output "namespaces" {
  value = data.kubernetes_all_namespaces.allns.namespaces
  
}

output "access_token" {
  value = local.access_token

}

output "headers" {
  value = data.http.openshift_auth.response_headers
}

output "body" {
  value = data.http.openshift_auth.response_body
}

output "status_code" {
  value = data.http.openshift_auth.status_code
}

output "id" {
  value = data.http.openshift_auth.id
}