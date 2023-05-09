locals {
  nginx_chart_url = "https://helm.nginx.com/stable"
}

resource "kubernetes_namespace" "nsm-monitoring" {
  metadata {
    name = "nsm-monitoring"
  }
}

resource "kubernetes_namespace" "kubernetes-dashboard" {
  metadata {
    name = "kubernetes-dashboard"
  }
}

resource "kubernetes_manifest" "deploy-setup-tools" {
  for_each   = { for each in var.files : each.path => each }
  manifest   = yamldecode(file(each.value.path))
  depends_on = [kubernetes_namespace.nsm-monitoring, kubernetes_namespace.kubernetes-dashboard]
}

resource "helm_release" "nginx-service-mesh" {
  repository       = local.nginx_chart_url
  chart            = "nginx-service-mesh"
  name             = "nginx-service-mesh"
  namespace        = var.nginx-namespace
  version          = var.nginx-version
  create_namespace = true

  set {
    name  = "mtls.mode"
    value = "permissive"
  }
  set {
    name  = "telemetry.samplerRatio"
    value = 1
  }
  set {
    name  = "telemetry.exporters.otlp.host"
    value = "otel-collector.nsm-monitoring.svc"
  }
  set {
    name  = "telemetry.exporters.otlp.port"
    value = 4317
  }
  set {
    name  = "prometheusAddress"
    value = "prometheus.nsm-monitoring.svc:9090"
  }
}

resource "helm_release" "nginx-ingress-controller" {
  repository       = local.nginx_chart_url
  chart            = "nginx-ingress"
  name             = "nginx-ingress"
  namespace        = var.nginx-ingress-namespace
  version          = var.nginx-ingress-version
  create_namespace = true

  set {
    name  = "nsm.nginx.com/enable-ingress"
    value = "true"
    type  = "string"
  }

  depends_on = [helm_release.nginx-service-mesh]
}