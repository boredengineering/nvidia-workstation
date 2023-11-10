locals {
    workstation_instance_name = var.workstation_instance_name
    workstation_instance_type = var.workstation_instance_type
}
#---------------------------------------------------------------
# Nvidia Workstation Instance
#---------------------------------------------------------------
resource "aws_instance" "nvidia_workstation" {
    # ami             = data.aws_ami.nvidia_omniverse_ubuntu.id
    ami             = data.aws_ami.nvidia_omniverse_windows.id
    instance_type   = local.workstation_instance_type

    vpc_security_group_ids = [aws_security_group.nucleusSG.id]
    # deploy using the first private subnet id from VPC module
    subnet_id = module.vpc.public_subnets[0]
    iam_instance_profile = aws_iam_instance_profile.nucleusInstanceProfile.name

    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 512
    }
    tags = {
        Name = local.workstation_instance_name
    }
    depends_on = [
        aws_security_group.nucleusSG
    ]
}
#---------------------------------------------------------------
# Nvidia Workstation AMI - Canonical Ubuntu 22.04 LTS Community Version
#---------------------------------------------------------------
data "aws_ami" "nvidia_omniverse_ubuntu" {
    most_recent = true
    owners = ["523997997732"]
    filter {
        name   = "name"
        values = ["NVIDIA Omniverse GPU-Optimized AMI"]
    }
}
data "aws_ami" "nvidia_omniverse_windows" {
    most_recent = true
    owners = ["599914391307"]
    filter {
        name   = "name"
        values = ["NVIDIA Omniverse VDI Windows Image (for use with g5 instances)"]
    }
}
#---------------------------------------------------------------
# Security Group for Nvidia Workstation
#---------------------------------------------------------------
resource "aws_security_group" "nucleusSG" {
    name        = "nucleusSG"
    description = "Security Group for Nvidia Workstation"
    vpc_id      = module.vpc.vpc_id
    egress {
        description = "Allows all Traffic Egress"    
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "nucleusSG"
    }
}
resource "aws_security_group_rule" "workstation_SG_ingress_rules" {
    count = length(var.workstation_SG_ingress_rules)

    type              = "ingress"
    description       = var.workstation_SG_ingress_rules[count.index].description
    from_port         = var.workstation_SG_ingress_rules[count.index].from_port
    to_port           = var.workstation_SG_ingress_rules[count.index].to_port
    protocol          = var.workstation_SG_ingress_rules[count.index].protocol
    cidr_blocks       = [var.workstation_SG_ingress_rules[count.index].cidr_block]
    
    security_group_id = aws_security_group.nucleusSG.id
}
#---------------------------------------------------------------
# Associate Elastic IP with an instance
#---------------------------------------------------------------
resource "aws_eip" "workstation_public_ip" {
    instance = aws_instance.nvidia_workstation.id
    domain   = "vpc"
    tags = {
        Name = local.workstation_instance_name
    }
}
#---------------------------------------------------------------
# End of Nvidia Workstation
#---------------------------------------------------------------