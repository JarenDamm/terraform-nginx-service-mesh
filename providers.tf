provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  experiments {
    manifest_resource = true
  }
  config_path = "~/.kube/config"
}

# provider "kubernetes-alpha" {
#     config_path = "~/.kube/config"
# }