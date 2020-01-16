data "oci_identity_availability_domains" "ads" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
}

data "oci_core_vnic_attachments" "bastion_vnic_attachments" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    instance_id = "${oci_core_instance.bastion.id}"
}

data "oci_core_vnic" "bastion_vnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.bastion_vnic_attachments.vnic_attachments[0],"vnic_id")}"
}

data "oci_objectstorage_namespace" "ns" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
}

data "oci_core_services" "object_storage" {
    filter {
        name   = "name"
        values = ["OCI .* Object Storage"]
        regex  = true
    }
}
