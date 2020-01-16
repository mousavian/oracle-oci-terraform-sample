resource "oci_objectstorage_bucket" "test_bucket" {
    count = "${var.create_bucket ? "1" : "0"}"

    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    name = "${var.bucket_name}"
    namespace = "${data.oci_objectstorage_namespace.ns.namespace}"

    freeform_tags = {"ManagedBy"= "TF11"}
    # access_type = "ObjectRead"
    access_type = "NoPublicAccess"
}
