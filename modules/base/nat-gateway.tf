resource "oci_core_nat_gateway" "my_ng" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "mynatgateway"
}
