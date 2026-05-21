variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
}

variable "system_vm_size" {
  type        = string
  description = "VM size for system node pool"
}

variable "user_vm_size" {
  type        = string
  description = "VM size for user node pools"
}

variable "os_disk_type" {
  type        = string
  description = "OS disk type for AKS node pools"
}

variable "os_disk_size_gb" {
  type        = number
  description = "OS disk size for AKS node pools"
}

variable "vnet_cidr" {
  description = "CIDR for the AKS virtual network"
  type        = string
}

variable "aks_subnet_1_cidr" {
  description = "CIDR for AKS system node pool subnet1"
  type        = string
}

variable "aks_subnet_2_cidr" {
  description = "CIDR for AKS user node pool subnet 2"
  type        = string
}

variable "aks_subnet_3_cidr" {
  description = "CIDR for AKS user node pool subnet 3"
  type        = string
}

variable "appgw_subnet_cidr" {
  description = "CIDR for Application Gateway subnet"
  type        = string
}

variable "pod_cidr" {
  description = "CIDR for AKS pods"
  type        = string
}

variable "service_cidr" {
  description = "CIDR for AKS services"
  type        = string
}

variable "dns_service_ip" {
  description = "DNS service IP inside the service CIDR"
  type        = string
}