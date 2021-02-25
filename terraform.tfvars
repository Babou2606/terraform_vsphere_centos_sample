# Provider
provider_vsphere_host     = "YOUR_IP_OR_FQDN"
provider_vsphere_user     = "YOUR_USER"
provider_vsphere_password = "YOUR_PASS"

# Infra
vsphere_compute_cluster = "YOUR_CLUSTER"
vsphere_network         = "YOUR_NETWORK"
vm_vsphere_folder      = "YOUR_FOLDER"
vsphere_datastore       = "YOUR_DATASTORE"

# Guest
guest_template     = "CentOS7-Template_FOR_EXEMPLE"
guest_ipv4_gateway = "YOUR_IP_GATEWAY"
guest_dns_servers  = ["FIRST_DNS", "SECOND_DNS"]
guest_dns_suffix   = ["CentOSTest.local"]
instance_count     = 1
guest_domain       = "CentOSTest"
guest_vcpu         = "2"
guest_memory       = "8128"
