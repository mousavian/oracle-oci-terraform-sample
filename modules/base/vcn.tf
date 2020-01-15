resource "oci_core_vcn" "test_vcn" {
    # Required
    cidr_block = "${var.vcn_cidr_block}"
    compartment_id = "${oci_identity_compartment.my_compartment.id}"

    # Optional
    display_name = "${var.vcn_name}"
    freeform_tags = {"ManagedBy"= "TF11"}
}
