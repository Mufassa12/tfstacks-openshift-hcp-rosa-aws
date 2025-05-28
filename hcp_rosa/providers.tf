terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    rhcs = {
      source  = "terraform-redhat/rhcs"
      version = "1.6.8"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }

  }
  required_version = "~> 1.12"
}