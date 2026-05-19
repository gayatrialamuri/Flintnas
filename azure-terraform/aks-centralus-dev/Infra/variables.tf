variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "centralus"
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "system_node_count" {
  description = "Node count for system node pool"
  type        = number
  default     = 1
}

variable "user_node_count" {
  description = "Node count for each user node pool"
  type        = number
  default     = 1
}

variable "system_vm_size" {
  description = "VM size for system node pool"
  type        = string
  default     = "Standard_B2pls_v2"
}

variable "user_vm_size" {
  description = "VM size for user node pools"
  type        = string
  default     = "Standard_B2pls_v2"
}

variable "os_disk_type" {
  description = "OS disk type for AKS node pools"
  type        = string
  default     = "Managed"
}

variable "os_disk_size_gb" {
  description = "OS disk size for AKS node pools"
  type        = number
  default     = 60
}

locals {
  base_name = "aks-${var.environment}"
}