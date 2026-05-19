resource "helm_release" "csi_driver" {

  name       = "csi-secrets-store"
  namespace  = "kube-system"
  repository = "https://azure.github.io/secrets-store-csi-driver-provider-azure/charts"
  chart      = "secrets-store-csi-driver"
  version    = "1.4.3"

  set {
    name  = "windows.enabled"
    value = "false"
  }

  set {
    name  = "secrets-store-csi-driver.enableSecretRotation"
    value = "true"
  }

  set {
    name  = "secrets-store-csi-driver.rotationPollInterval"
    value = "2m"
  }
}