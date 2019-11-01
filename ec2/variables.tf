

variable "key_name" {
    default = "mykeyname"
}

variable "public_key_path" {
    default = "/home/ec2-user/.ssh/id_rsa"
}

variable "ami_id" {
    default = "ami-0b69ea66ff7391e80"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_count" {
    default = "2"
}

variable "subnet_id" {}

variable "security_group" {}

