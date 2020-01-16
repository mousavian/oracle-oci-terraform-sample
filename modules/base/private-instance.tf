resource "oci_core_instance" "private_instance" {
    count = "${var.create_private_instance ? "1" : "0"}"

    # Required
    availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[0], "name")}"
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    shape = "${var.bastion_instance_shape}"
    create_vnic_details {
        # Required
        subnet_id = "${oci_core_subnet.private_subnet.id}"
        assign_public_ip = false

        # Optional
        freeform_tags = {"ManagedBy"= "TF11"}
        nsg_ids = [
            "${oci_core_network_security_group.default.id}",
            "${oci_core_network_security_group.private_ins_sg.id}"
        ]
    }

    source_details {
        source_id = "${var.bastion_image_ocid}"
        source_type = "image"
    }

    # Optional
    preserve_boot_volume = false
    display_name = "${var.private_instance_name}"
    freeform_tags = {"ManagedBy"= "TF11"}
    metadata = {
        ssh_authorized_keys = "${var.ssh_public_key}"
    }
}
