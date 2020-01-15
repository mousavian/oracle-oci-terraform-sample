resource "oci_core_internet_gateway" "test_internet_gateway" {
    #Required
    compartment_id = "${oci_identity_compartment.compartment_x.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    #Optional
    enabled = "true"
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "ig-x"
}
