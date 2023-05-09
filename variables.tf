variable "kube_context" {
  type    = string
  default = ""
}
variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "nginx-namespace" {
  type        = string
  default     = "nginx-mesh"
  description = "The K8s namespace in which to install the Helm chart, default: 'nginx-mesh'"
}

variable "nginx-version" {
  type        = string
  default     = "2.0.0"
  description = "The version of the helm chart to install"
}

variable "files" {
  type = list(object({
    path = string
  }))
}
