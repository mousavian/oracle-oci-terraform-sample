resource "oci_core_instance" "bastion" {
    # Required
    availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[0], "name")}"
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    shape = "${var.bastion_instance_shape}"
    create_vnic_details {
        # Required
        subnet_id = "${oci_core_subnet.public_subnet.id}"

        # Optional
        nsg_ids = ["${oci_core_network_security_group.my_nsg.id}"]
        freeform_tags = {"ManagedBy"= "TF11"}
    }

    source_details {
        source_id = "${var.bastion_image_ocid}"
        source_type = "image"
    }

    # Optional
    preserve_boot_volume = false
    display_name = "${var.bastion_hostname}"
    freeform_tags = {"ManagedBy"= "TF11"}
    metadata = {
        ssh_authorized_keys = "${var.ssh_public_key}"
    }
}
