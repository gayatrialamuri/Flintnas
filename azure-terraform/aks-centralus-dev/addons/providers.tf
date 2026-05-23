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