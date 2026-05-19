output "cert_manager_release" {
  description = "Helm release details for cert-manager"
  value = {
    name      = helm_release.cert_manager.name
    namespace = helm_release.cert_manager.namespace
    version   = helm_release.cert_manager.version
    status    = helm_release.cert_manager.status
  }
}

output "kured_release" {
  description = "Helm release details for kured"
  value = {
    name      = helm_release.kured.name
    namespace = helm_release.kured.namespace
    version   = helm_release.kured.version
    status    = helm_release.kured.status
  }
}

output "prometheus_release" {
  description = "Helm release details for Prometheus"
  value = {
    name      = helm_release.kube_prometheus_stack.name
    namespace = helm_release.kube_prometheus_stack.namespace
    version   = helm_release.kube_prometheus_stack.version
    status    = helm_release.kube_prometheus_stack.status
  }
}

output "keda_release" {
  description = "Helm release details for KEDA"
  value = {
    name      = helm_release.keda.name
    namespace = helm_release.keda.namespace
    version   = helm_release.keda.version
    status    = helm_release.keda.status
  }
}