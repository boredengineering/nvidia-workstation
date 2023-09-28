variable "domain_name" {
    description = "FQDN (Fully Qualified Domain Name)"
    type        = string
}
variable "subdomain_name" {
    description = "subdomain for the FQDN (Fully Qualified Domain Name)"
    type        = string
}
variable "region" {
    description = "Region to create the instance"
    type        = string
}
variable "profile_name" {
    description = "AWS SSO Profile Name, same used for BotoCore"
    type        = string
}
#---------------------------------------------------------------
# Network
#---------------------------------------------------------------
# 10.0.0.0/20
variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "subnet" {
    default = "10.0.0.0/24"
}
#---------------------------------------------------------------
# Nucleus Server
#---------------------------------------------------------------
variable "workstation_instance_name" {
    description = "Name of instance"
    type        = string
}
variable "workstation_instance_type" {
    description = "The instance type"
    type        = string
    default     = "g5.2xlarge"
}

#---------------------------------------------------------------
# Nucleus Server Security Group
#---------------------------------------------------------------
variable "nucleusSG_ingress_rules" {
    type = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_block  = string
    }))
    default     = [
        {
            description = "HTTP Traffic"
            from_port   = 8080
            to_port     = 8080
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Auth login"
            from_port   = 3180
            to_port     = 3180
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Auth Service"
            from_port   = 3100
            to_port     = 3100
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Discovery Service"
            from_port   = 3333
            to_port     = 3333
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "LFT"
            from_port   = 3030
            to_port     = 3030
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Core API"
            from_port   = 3019
            to_port     = 3019
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Tagging Service"
            from_port   = 3020
            to_port     = 3020
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Search Service"
            from_port   = 3400
            to_port     = 3400
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
    ]
}
#---------------------------------------------------------------
# Proxy Server Security Group
#---------------------------------------------------------------
variable "proxySG_ingress_rules" {
    type = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_block  = string
    }))
    default     = [
        {
            description = "HTTPS Traffic"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Auth login"
            from_port   = 3180
            to_port     = 3180
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Auth Service"
            from_port   = 3100
            to_port     = 3100
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Discovery Service"
            from_port   = 3333
            to_port     = 3333
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "LFT"
            from_port   = 3030
            to_port     = 3030
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Core API"
            from_port   = 3019
            to_port     = 3019
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Tagging Service"
            from_port   = 3020
            to_port     = 3020
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
        {
            description = "Search Service"
            from_port   = 3400
            to_port     = 3400
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
    ]
}