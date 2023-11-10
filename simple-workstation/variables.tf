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
# Nvidia Workstation
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
# Nvidia Workstation Security Group
#---------------------------------------------------------------
variable "workstation_SG_ingress_rules" {
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
            from_port   = 8443
            to_port     = 8443
            protocol    = "tcp"
            cidr_block  = "0.0.0.0/0"
        },
    ]
}