required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }

  kubernetes = {
    source  = "hashicorp/kubernetes"
    version = "~> 2.3"
  }

  time = {
    source = "hashicorp/time"
    version = "~> 0.1"
  }
  random = {
    source = "hashicorp/random"
    version = "~> 3.0"
  }
  null = {
    source = "hashicorp/null"
    version = "~> 3.0"
  }
  rhcs = {
    source = "terraform-redhat/rhcs"
    version = "~> 1.6"
  }

  http = {
    source = "hashicorp/http"
    version =  "3.4.5"
  }
  
}

provider "aws" "configurations" {

  config {
    region = var.region

    assume_role_with_web_identity {
      role_arn                = var.role_arn
      web_identity_token = var.aws_identity_token
    }
  }
}

provider "rhcs" "this" {
  config {
    token  = var.rhcs_token
  }
}

# provider "kubernetes" "config" {
#   config { 
#     host = component.hcp_rosa.cluster_api_url
#     token = component.hcp_rosa.sts_token
#     insecure = true
#   }
# }


provider "random" "this" {}
provider "time" "this" {} 
provider "null" "this" {}
provider "http" "this" {}