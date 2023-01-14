#for VPC and Subnets

variable "cidr" {
    default = "172.16.0.0/24"
}

variable "dns-hostname" {
    type = list
    default = [true, false]
}
variable "dns-support" {
    type = list
    default = [true, false]
}

variable "subnetcidr" {
    type = list
    default = ["172.16.0.0/26","172.16.0.128/26"]
}

variable "name" {
    type = list
    default = ["ag", "jay", "paradin"]
}

#For ec2
variable "ami_id" {
    type = map
    default = {
        "linux": "ami-0fe472d8a85bc7b0e",
        "ubuntu": "ami-0574da719dca65348",
        "centos": "ami-002070d43b0a4f171",
        "redhat": "ami-08e637cea2f053dfa"
    }
}

variable "port-sg" {
    type = list 
    default = ["22", "80", "443"]
}
