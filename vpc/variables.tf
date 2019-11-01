#-----vpc/variables.tf--------

variable "cidr_block" {
    default = "12.0.0.0/16"
}

variable "public_subnet1" {
    default = "12.0.1.0/24"
}

variable "public_subnet2" {
    default = "12.0.2.0/24"
}

variable "public_az1" {
    default = "us-east-1a"
}

variable "public_az2" {
    default = "us-east-1b"
}

variable "private_az1" {
    default = "us-east-1c"
}

variable "private_az2" {
    default = "us-east-1d"
}



variable "private_subnet1" {
    default = "12.0.3.0/24"
}


variable "private_subnet2" {
    default = "12.0.4.0/24"
}