resource "oci_core_security_list" "test_security_list" {
    # Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "sl-x"

    ingress_security_rules {
        # Required
        protocol = "all"
        source = "0.0.0.0/0"
    }
}
