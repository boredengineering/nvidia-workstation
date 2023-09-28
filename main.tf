locals {
    instance_name       = var.workstation_instance_name
    instance_type       = var.workstation_instance_type
    # Network
    vpc_cidr = var.cidr_block

    # fix ordering using toset
    available_azs_cpu = toset(data.aws_ec2_instance_type_offerings.availability_zones_cpu.locations)
    available_azs     = tolist(local.available_azs_cpu)

    az_count = min(length(local.available_azs), 3)
    azs      = slice(local.available_azs, 0, local.az_count)
    public-subnet_name_list = [for k, v in local.azs : "${local.instance_name}-public-subnet-${k}"]
    tags = {
        Name = local.instance_name
    }
}

#---------------------------------------------------------------
# VPC
#---------------------------------------------------------------
module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.0.0"

    name = local.instance_name
    cidr = local.vpc_cidr

    azs             = local.azs
    public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 3, k)]
    
    public_subnet_names  = [for k, v in local.azs : "${local.instance_name}-subnet-${k}"]

    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true
    enable_dns_support   = true
    # Adopt the default network ACL into our terraform state
    manage_default_network_acl    = true
    default_network_acl_tags      = { Name = "${local.instance_name}-default-nacl" }

    # Adopt the default route table into our terraform state
    manage_default_route_table    = true
    default_route_table_tags      = { Name = "${local.instance_name}-default-route-table" }

    # Adopt the default security group into our terraform state
    manage_default_security_group = true
    default_security_group_tags   = { Name = "${local.instance_name}-default-sg" }
    
    public_subnet_tags = {
        Name = "${local.instance_name}-public-subnet"
    }

    tags = local.tags
}

#---------------------------------------------------------------
# Instance Availability
#---------------------------------------------------------------
data "aws_ec2_instance_type_offerings" "availability_zones_cpu" {
    filter {
        name   = "instance-type"
        values = [var.instance_type]
    }

    location_type = "availability-zone"
}