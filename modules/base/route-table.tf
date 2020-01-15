resource "oci_core_route_table" "public_subnet_ig_rt" {
    #Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    #Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "rt-public-to-ig"

    route_rules {
        #Required
        network_entity_id = "${oci_core_internet_gateway.my_ig.id}"

        #Optional
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}
