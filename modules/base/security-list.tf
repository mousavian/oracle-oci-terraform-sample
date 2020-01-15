resource "oci_core_security_list" "my_sl" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "sl-ing-allow-all"

    ingress_security_rules {
        # Required
        protocol = "all"
        source = "0.0.0.0/0"
    }
}
