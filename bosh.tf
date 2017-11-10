resource "vsphere_virtual_machine" "bosh" {
  name     = "${var.vcenter_network}-bosh"
  hostname = "${var.vcenter_network}"
  folder   = "${var.vcenter_vms}"
  vcpu     = 2
  memory   = 4096

  skip_customization = true

  datacenter    = "${var.vcenter_dc}"
  cluster       = "${var.vcenter_cluster}"
  resource_pool = "${var.vcenter_rp}"

  network_interface {
    label              = "${var.vcenter_network}"
    ipv4_address       = "${var.vcenter_network_ipv4_address}"
    ipv4_prefix_length = "${var.vcenter_network_ipv4_prefix_length}"
  }

  disk {
    datastore = "${var.vcenter_ds}"
    template = "${var.vcenter_templates}"
  }
}
