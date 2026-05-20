variable "kured_version" {
  type        = string
  description = "Helm chart version for Kured"
  default     = "5.4.4"
}

variable "prometheus_version" {
  type        = string
  description = "Helm chart version for kube-prometheus-stack"
  default     = "58.3.0"
}

variable "cert_manager_version" {
  type        = string
  description = "Helm chart version for cert-manager"
  default     = "v1.15.0"
}

variable "csi_driver_version" {
  type        = string
  description = "Helm chart version for Key Vault CSI Driver"
  default     = "1.4.3"
}

variable "keda_version" {
  type        = string
  description = "Helm chart version for KEDA"
  default     = "2.14.2"
}

variable "agic_version" {
  type        = string
  description = "Helm chart version for AGIC"
  default     = "1.7.2"
}

variable "kube_host" {}
variable "kube_client_certificate" {}
variable "kube_client_key" {}
variable "kube_ca" {}