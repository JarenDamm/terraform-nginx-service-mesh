terraform {
  required_version = ">= 1.1"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.5.0"
    }
    # kubernetes-alpha = {
    #   source = "hashicorp/kubernetes-alpha"
    #   version = "0.6.0"
    # }
  }
}