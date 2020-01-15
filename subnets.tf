resource "oci_core_subnet" "public_subnet" {
    # Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    cidr_block = "${var.public_subnet_cidr_block}"

    # Optional
    display_name = "public-subnet-x"
    freeform_tags = {"ManagedBy"= "TF11"}
    route_table_id = "${oci_core_route_table.public_subnet_ig_rt.id}"
    security_list_ids = ["${oci_core_security_list.test_security_list.id}"]
}

resource "oci_core_subnet" "private_subnet" {
    # Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    cidr_block = "${var.private_subnet_cidr_block}"

    # Optional
    display_name = "private-subnet-x"
    freeform_tags = {"ManagedBy"= "TF11"}
    prohibit_public_ip_on_vnic = "true"
}


variable "public_subnet_cidr_block" {
    default = "192.168.1.0/25"
}

variable "private_subnet_cidr_block" {
    default = "192.168.1.128/25"
}
