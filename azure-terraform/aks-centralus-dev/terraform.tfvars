vnet_cidr = "10.0.0.0/16"

aks_subnet_1_cidr = "10.0.1.0/24"
aks_subnet_2_cidr = "10.0.2.0/24"
aks_subnet_3_cidr = "10.0.3.0/24"

appgw_subnet_cidr = "10.0.10.0/24"

pod_cidr       = "10.2.0.0/16"
service_cidr   = "10.1.0.0/16"
dns_service_ip = "10.1.0.10"

location        = "centralus"
environment     = "dev"
system_vm_size  = "Standard_B2pls_v2"
user_vm_size    = "Standard_B2pls_v2"
os_disk_type    = "Managed"
os_disk_size_gb = 60