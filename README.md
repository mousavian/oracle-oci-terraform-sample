# oracle-oci-terraform-sample

This is just a sample code to quickly create and configure Compartment, VCN, Networks and a bastion host in public subnet to ssh into.


## HOW-TO
1. [Generate API Signing Key in PEM format](#Generate-API-Signing-Key-in-PEM-format) if you don't have it
2. Set [required env vars](#Required-Env-Vars)
3. Run
```bash
terraform init
terraform plan
terraform apply
```

### Generate API Signing Key in PEM format
```bash
mkdir ~/.oci
openssl genrsa -out ~/.oci/oci_api_key.pem 2048
chmod go-rwx ~/.oci/oci_api_key.pem
openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
```


### Required Env Vars
You need to provide `tenancy_ocid`, `user_ocid`, `private_key_path`, `fingerprint`, and `ssh_public_key` for terraform via env var.

Refer to [env-vars.sample](env-vars.sample) file.

