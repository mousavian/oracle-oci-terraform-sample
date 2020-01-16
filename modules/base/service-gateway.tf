resource "oci_core_service_gateway" "test_service_gateway" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    services {
        service_id = "${data.oci_core_services.object_storage.services.0.id}"
    }

    display_name = "object-storage-svc-gw"
    freeform_tags = {"ManagedBy"= "TF11"}
}
