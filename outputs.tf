#-----root/outputs.tf--------


output "VPC-ID" {
    value = "${module.vpc.VPC-ID}"
}

output "InternetGateway" {
    value = "${module.vpc.InternetGateway}"
}

output "PublicSubnet1" {
    value = "${module.vpc.PublicSubnet1}"
}

output "PublicSubnet2" {
    value = "${module.vpc.PublicSubnet2}"
}

output "PrivateSubnet1" {
    value = "${module.vpc.PrivateSubnet1}"
}

output "PrivateSubnet2" {
    value = "${module.vpc.PrivateSubnet2}"
}


output "SecurityGroup" {
    value = "${module.vpc.sg}"
}

