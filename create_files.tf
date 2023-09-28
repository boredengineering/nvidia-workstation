locals {
    region = var.region
    domain = var.domain_name

    bucketname = aws_s3_bucket.artifactsBucket.id
    cert_arn = aws_acm_certificate.main.arn
    role_arn = aws_iam_role.proxyInstanceRole.arn
    role_policy_arn = aws_iam_policy.revProxyCertAssociationPolicy.arn
    nucleusServerPrivateDnsName = aws_instance.nucleus.private_dns
}
# bucketname - aws_s3_bucket.artifactsBucket.id
# tlsCertifcateArn - cert_arn - aws_acm_certificate.main.arn

#---------------------------------------------------------------
# Null Data Source to Load Template Data
#---------------------------------------------------------------
# May be useful later in other parts
#---------------------------------------------------------------
# Load data for associate_enclave_cert
data "null_data_source" "associate_enclave_cert" {
    inputs = {
        content = templatefile("./templates/associate_enclave_cert.tftpl", {
            tlsCertificateArn = "${local.cert_arn}",
            proxyInstanceRoleArn = "${local.role_arn}",
            proxyCertAssociationPolicyArn = "${local.role_policy_arn}",
            region = "${local.region}",
            profile_name = "${var.profile_name}"
        })
    }
}
# Load data for disassociate_enclave_cert
data "null_data_source" "disassociate_enclave_cert" {
    inputs = {
        content = templatefile("./templates/disassociate_enclave_cert.tftpl", {
            tlsCertificateArn = "${local.cert_arn}",
            proxyInstanceRoleArn = "${local.role_arn}",
            region = "${local.region}",
            profile_name = "${var.profile_name}"
        })
    }
}
# Load data for nginx
data "null_data_source" "nginx" {
    inputs = {
        content = templatefile("./templates/nginx.tftpl", {
            region = "${local.region}",
            profile = "${var.profile_name}",
            Bucketname = "${local.bucketname}",
            proxyCertAssociationPolicyArn = "${local.role_policy_arn}",
            proxyInstanceRoleArn = "${local.role_arn}",
            tlsCertificateArn = "${local.cert_arn}",
            domain = "nucleus.${local.domain}",
            NucleusServerPrivateDnsName = "${local.nucleusServerPrivateDnsName}",
        })
    }
}
# Load data for nucleus
data "null_data_source" "nucleus" {
    inputs = {
        content = templatefile("./templates/nucleus.tftpl", {
            region = "${local.region}",
            profile = "${var.profile_name}",
            Bucketname = "${local.bucketname}",
            domain = "nucleus.${local.domain}",
            NucleusServerPrivateDnsName = "${local.nucleusServerPrivateDnsName}"
        })
    }
}
#---------------------------------------------------------------
# Resource local_file - create all the files
#---------------------------------------------------------------
# Create associate_enclave_cert.py
resource "local_file" "associate_enclave_cert" {
  filename = "./scripts/associate_enclave_cert.py"
  content  = data.null_data_source.associate_enclave_cert.outputs["content"]
}
# Create disassociate_enclave_cert.py
resource "local_file" "disassociate_enclave_cert" {
  filename = "./scripts/disassociate_enclave_cert.py"
  content  = data.null_data_source.disassociate_enclave_cert.outputs["content"]
}
# Create nginx.yaml for group_vars
resource "local_file" "nginx_group_vars" {
  filename = "./ansible/group_vars/nginx.yaml"
  content  = data.null_data_source.nginx.outputs["content"]
}
# Create nucleus.yaml for group_vars
resource "local_file" "nucleus_group_vars" {
  filename = "./ansible/group_vars/nucleus.yaml"
  content  = data.null_data_source.nucleus.outputs["content"]
}