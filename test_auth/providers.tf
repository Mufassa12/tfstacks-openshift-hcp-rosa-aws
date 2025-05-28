terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    http = {
            source  = "hashicorp/http"
            version = "3.4.5"
        }
  }
required_version = ">= 1.11.0"
}