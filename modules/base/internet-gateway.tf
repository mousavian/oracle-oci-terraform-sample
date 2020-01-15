resource "oci_core_internet_gateway" "my_ig" {
    #Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    #Optional
    enabled = "true"
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "ig-x"
}
