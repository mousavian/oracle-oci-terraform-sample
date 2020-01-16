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

resource "oci_core_route_table" "private_subnet_svc_gt_rt" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "rt-private-to-svc-gw"

    route_rules {
        destination       = "${lookup(data.oci_core_services.object_storage.services[0], "cidr_block")}"
        destination_type  = "SERVICE_CIDR_BLOCK"
        network_entity_id = "${oci_core_service_gateway.test_service_gateway.id}"
    }
}


