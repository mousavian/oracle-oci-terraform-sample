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

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "ssh_public_key" {}

variable "region" {
    default = "ap-sydney-1"
}

variable "ad" {
    default = "FAPC:AP-SYDNEY-1-AD-1"
}

