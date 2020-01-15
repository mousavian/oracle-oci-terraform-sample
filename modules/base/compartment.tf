
resource "oci_identity_compartment" "my_compartment" {
    # Required
    compartment_id = "${var.tenancy_ocid}"
    description = "${var.compartment_desc}"
    name = "${var.compartment_name}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
}
