resource "oci_core_network_security_group" "my_nsg" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "nsg-x"
}

resource "oci_core_network_security_group_security_rule" "my_nsg_ing_rule" {
    # Required
    network_security_group_id = "${oci_core_network_security_group.my_nsg.id}"
    direction = "INGRESS"
    protocol = "all"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
}
