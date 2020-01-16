terraform {
    required_version = "= 0.11.7"

    backend "local" {
        path = "./.terraform/terraform.tfstate"
    }
}

provider "oci" {
    tenancy_ocid = "${var.tenancy_ocid}"
    user_ocid = "${var.user_ocid}"
    fingerprint = "${var.fingerprint}"
    private_key_path = "${var.private_key_path}"
    region = "${var.region}"
}

module "base" {
    source = "./modules/base"
    tenancy_ocid = "${var.tenancy_ocid}"
    ssh_public_key = "${var.ssh_public_key}"
    user_ocid = "${var.user_ocid}"
    fingerprint = "${var.fingerprint}"
    private_key_path = "${var.private_key_path}"
    region = "${var.region}"

    compartment_name = "comp-x"
    compartment_desc = "comp-x test"

    create_private_instance = true
    private_instance_name = "instance-x"

    create_bucket = true
    bucket_name = "test"
}

output "ssh_to_bastion_command" {
    value = "ssh opc@${module.base.bastion_public_ip}"
}
