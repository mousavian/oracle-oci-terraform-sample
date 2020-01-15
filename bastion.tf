resource "oci_core_instance" "bastion" {
    # Required
    availability_domain = "${var.ad}"
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    shape = "${var.instance_shape}"
    create_vnic_details {
        # Required
        subnet_id = "${oci_core_subnet.public_subnet.id}"

        # Optional
        nsg_ids = ["${oci_core_network_security_group.test_nsg.id}"]
        freeform_tags = {"ManagedBy"= "TF11"}
    }

    source_details {
        # Oracle Autonomous Linux 7.7 Image
        # https://docs.cloud.oracle.com/iaas/images/image/b75ea855-adbc-4b5d-8657-8fb5245dd130/
        source_id = "ocid1.image.oc1.ap-sydney-1.aaaaaaaasutqd2sszqzn4z2cojqxa7n6oag3r7cxaoamfhegrr6yel6f7wja"
        source_type = "image"
    }

    # Optional
    preserve_boot_volume = false
    display_name = "bastion-x"
    freeform_tags = {"ManagedBy"= "TF11"}
    hostname_label = "bastion-x"
    metadata = {
        ssh_authorized_keys = "${var.ssh_public_key}"
    }
}

variable "instance_shape" {
    default = "VM.Standard.E2.1.Micro"
}

data "oci_core_vnic_attachments" "bastion_vnic_attachments" {
    # Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    instance_id = "${oci_core_instance.bastion.id}"
}

data "oci_core_vnic" "bastion_vnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.bastion_vnic_attachments.vnic_attachments[0],"vnic_id")}"
}

output "bastion_public_ip" {
    value = "${data.oci_core_vnic.bastion_vnic.public_ip_address}"
}
