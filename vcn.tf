resource "oci_core_vcn" "test_vcn" {
    # Required
    cidr_block = "${var.vcn_cidr_block}"
    compartment_id = "${oci_identity_compartment.compartment_x.id}"

    # Optional
    display_name = "vcn-x"
    freeform_tags = {"ManagedBy"= "TF11"}
    dns_label = "${var.vcn_dns_label}"
}

variable "vcn_cidr_block" {
    default = "192.168.1.0/24"
}

variable "vcn_dns_label" {
    default = "dnsx"
}
