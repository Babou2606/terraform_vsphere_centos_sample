##### Provider
provider "vsphere" {
  user           = var.provider_vsphere_user
  password       = var.provider_vsphere_password
  vsphere_server = var.provider_vsphere_host

  # for self-signed cert
  allow_unverified_ssl = true
}

##### Data sources
data "vsphere_datacenter" "dc" {
  name = "YOUR_DC"
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "user_vm" {
  name          = var.guest_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

##### Resources
resource "vsphere_virtual_machine" "linux_test_clients" {
  count            = var.instance_count
  name             = "VLINCENTOS180-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vm_vsphere_folder

  num_cpus = var.guest_vcpu
  memory   = var.guest_memory
  guest_id = data.vsphere_virtual_machine.user_vm.guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.user_vm.network_interface_types[0]
  }

  disk {
    label = "disk0"
    size  = "70" 
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.user_vm.id
    
    ### Core templates might not be able to configure network interface.
    ### e.g. on CentOS7 core, you will need Perl package.
    customize {
        linux_options {
          domain =  var.guest_domain
          host_name = "VLINCENTOS180-${count.index + 1}"
        }

        network_interface {
          ipv4_address = "10.20.1.${114 + count.index}"
          ipv4_netmask = "24"
        }

        ipv4_gateway    = var.guest_ipv4_gateway
        dns_server_list = var.guest_dns_servers
        dns_suffix_list = var.guest_dns_suffix
    }
  }
}
