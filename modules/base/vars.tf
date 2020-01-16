variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "ssh_public_key" {}
variable "region" {}

variable "compartment_desc" {}
variable "compartment_name" {}

variable "vcn_name" {
    default = "my-vcn"
}

variable "vcn_cidr_block" {
    default = "192.168.1.0/24"
}

variable "bastion_image_ocid" {
    # Oracle Autonomous Linux 7.7 Image
    # https://docs.cloud.oracle.com/iaas/images/image/b75ea855-adbc-4b5d-8657-8fb5245dd130/
    default = "ocid1.image.oc1.ap-sydney-1.aaaaaaaasutqd2sszqzn4z2cojqxa7n6oag3r7cxaoamfhegrr6yel6f7wja"
}

variable "bastion_instance_shape" {
    default = "VM.Standard.E2.1.Micro"
}

variable "public_subnet_cidr_block" {
    default = "192.168.1.0/25"
}

variable "create_private_instance" {
    default = true
}

variable "private_subnet_cidr_block" {
    default = "192.168.1.128/25"
}

variable "private_instance_name" {}

variable "create_bucket" {
    default = true
}

variable "bucket_name" {}
