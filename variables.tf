##### Provider
# - Arguments to configure the VMware vSphere Provider
variable "provider_vsphere_host" {
  description = "vCenter server FQDN or IP"
}

variable "provider_vsphere_user" {
  description = "vSphere username to use to connect to the environment - Default: root@vsphere.local"
  default     = "root@vsphere.local"
}

variable "provider_vsphere_password" {
  description = "vSphere password"
}


### Infrastructure
variable "vsphere_compute_cluster" {
    description = "The cluster for the VMs to run in"
}

variable "vsphere_network" {
    description = "The networks for the VMs to run in"
}

variable "vm_vsphere_folder" {
    description = "The folder containing the VMs"
}

variable "vsphere_datastore" {
  description = "Datastore in which the virtual machine will be deployed."
}
    
##### Guest
# - Describes virtual machine / guest options
variable "guest_template" {
  description = "The source virtual machine or template to clone from."
}

variable "guest_domain" {
    description = "The domain name for the guest"
}

variable "guest_ipv4_gateway" {
  description = "The IPv4 default gateway."
}

variable "guest_dns_servers" {
  description = "The list of DNS servers to configure on the virtual machine."
}

variable "guest_dns_suffix" {
  description = "A list of DNS search domains to add to the DNS configuration on the virtual machine."
}

variable "instance_count" {
    description = "The number of instances to be created"
    default     = 1
}

variable "guest_vcpu" {
  description = "The number of virtual processors to assign to this virtual machine. Default: 1."
  default     = "2"
}

variable "guest_memory" {
  description = "The size of the virtual machine's memory, in MB. Default: 1024 (1 GB)."
  default     = "8128"
}
