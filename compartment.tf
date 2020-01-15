
resource "oci_identity_compartment" "compartment_x" {
    # Required
    compartment_id = "${var.tenancy_ocid}"
    description = "comp-x test"
    name = "comp-x"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
}
