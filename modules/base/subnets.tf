resource "oci_core_subnet" "public_subnet" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    cidr_block = "${var.public_subnet_cidr_block}"

    # Optional
    display_name = "public-subnet"
    freeform_tags = {"ManagedBy"= "TF11"}
    route_table_id = "${oci_core_route_table.public_subnet_ig_rt.id}"
    security_list_ids = [
        "${oci_core_security_list.default.id}",
        "${oci_core_security_list.allow_icmp.id}",
        "${oci_core_security_list.allow_ssh.id}",
        "${oci_core_security_list.allow_all.id}"
    ]
}

resource "oci_core_subnet" "private_subnet" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    cidr_block = "${var.private_subnet_cidr_block}"

    # Optional
    display_name = "private-subnet"
    freeform_tags = {"ManagedBy"= "TF11"}
    prohibit_public_ip_on_vnic = "true"
    security_list_ids = [
        "${oci_core_security_list.default.id}",
        "${oci_core_security_list.allow_ssh.id}",
        "${oci_core_security_list.allow_icmp.id}"
    ]
}
