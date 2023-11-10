output "region" {
    description = "Region of the Instances"
    value = var.region
}

output "artifactsBucketName" {
    description = "Bucket Name used to configure the instances"
    value = aws_s3_bucket.artifactsBucket.id
}

output "Workstation_public_IP" {
    description = "Also Known as BASE_STACK_IP_OR_HOST at docker-compose env and nginx.conf"
    value = aws_eip.workstation_public_ip.public_ip
}