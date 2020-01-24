resource "oci_core_security_list" "default" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "default"
}

resource "oci_core_security_list" "allow_all" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "allow-all"

    ingress_security_rules {
        # Required
        protocol = "all"
        source = "0.0.0.0/0"
    }
}


resource "oci_core_security_list" "allow_all_egress" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "allow-all-egress"

    egress_security_rules {
        protocol = "all"
        destination = "0.0.0.0/0"
    }
}

resource "oci_core_security_list" "allow_icmp" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "allow-icmp"

    ingress_security_rules {
        protocol = 1 # ICMP
        source = "0.0.0.0/0"
    }

    egress_security_rules {
        protocol = 1 # ICMP
        destination = "0.0.0.0/0"
    }
}

resource "oci_core_security_list" "allow_ssh" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "allow-ssh"

    ingress_security_rules {
        protocol = 6 # TCP
        source = "0.0.0.0/0"
        tcp_options {
            min = 22
            max = 22
        }
    }
}
