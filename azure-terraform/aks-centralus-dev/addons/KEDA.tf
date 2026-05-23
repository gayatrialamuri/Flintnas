resource "helm_release" "keda" {
  name             = "keda"
  namespace        = "keda"
  create_namespace = true

  repository = "https://kedacore.github.io/charts"
  chart      = "keda"
  version    = var.keda_version

  set {
    name  = "podSecurityContext.fsGroup"
    value = "1000"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "metricsServer.enabled"
    value = "true"
  }
}