resource "helm_release" "kured" {

  name             = "kured"
  namespace        = "kured"
  create_namespace = true

  repository = "https://weaveworks.github.io/kured"
  chart      = "kured"
  version    = var.kured_version

  set {
    name  = "nodeSelector.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "extraArgs.time-zone"
    value = "America/New_York"
  }

  set {
    name  = "extraArgs.start-time"
    value = "02:00"
  }

  set {
    name  = "extraArgs.end-time"
    value = "05:00"
  }
}