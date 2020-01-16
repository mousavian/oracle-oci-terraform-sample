resource "oci_core_network_security_group" "default" {
    # Required
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"

    # Optional
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "default"
}

resource "oci_core_network_security_group" "bastion_sg" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "bastion-sg"
}

resource "oci_core_network_security_group_security_rule" "bastion_ing_rule" {
    network_security_group_id = "${oci_core_network_security_group.bastion_sg.id}"
    direction = "INGRESS"
    protocol = "all"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "bastion_eg_rule" {
    network_security_group_id = "${oci_core_network_security_group.bastion_sg.id}"
    direction = "EGRESS"
    protocol = "all"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group" "private_ins_sg" {
    compartment_id = "${oci_identity_compartment.my_compartment.id}"
    vcn_id = "${oci_core_vcn.test_vcn.id}"
    freeform_tags = {"ManagedBy"= "TF11"}
    display_name = "private-instance-sg"
}

resource "oci_core_network_security_group_security_rule" "private_ins_ing_rule" {
    network_security_group_id = "${oci_core_network_security_group.private_ins_sg.id}"
    direction = "INGRESS"
    protocol = "all"
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
}

resource "oci_core_network_security_group_security_rule" "private_ins_eg_rule" {
    network_security_group_id = "${oci_core_network_security_group.private_ins_sg.id}"
    direction = "EGRESS"
    protocol = "all"
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
}
