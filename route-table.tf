resource "oci_core_route_table" "public_subnet_ig_rt" {
    #Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    #Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "rt-x"

    route_rules {
        #Required
        network_entity_id = "${oci_core_internet_gateway.test_internet_gateway.id}"

        #Optional
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}
