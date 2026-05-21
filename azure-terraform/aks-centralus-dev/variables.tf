variable "location" { type = string }
variable "environment" { type = string }

variable "system_vm_size" { type = string }
variable "user_vm_size" { type = string }
variable "os_disk_type" { type = string }
variable "os_disk_size_gb" { type = number }

variable "vnet_cidr" { type = string }
variable "aks_subnet_1_cidr" { type = string }
variable "aks_subnet_2_cidr" { type = string }
variable "aks_subnet_3_cidr" { type = string }
variable "appgw_subnet_cidr" { type = string }

variable "pod_cidr" { type = string }
variable "service_cidr" { type = string }
variable "dns_service_ip" { type = string }