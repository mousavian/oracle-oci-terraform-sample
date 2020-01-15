output "bastion_public_ip" {
    value = "${data.oci_core_vnic.bastion_vnic.public_ip_address}"
}
