#--------vpc/outputs.tf-----------


output "VPC-ID" {
    value = "${aws_vpc.vpc.id}"
}

output "InternetGateway" {
    value = "${aws_internet_gateway.igw.id}"
}

output "PublicSubnet1" {
    value = "${aws_subnet.public_subnet1.id}"
}

output "PublicSubnet2" {
    value = "${aws_subnet.public_subnet2.id}"
}

output "PrivateSubnet1" {
    value = "${aws_subnet.private_subnet1.id}"
}

output "PrivateSubnet2" {
    value = "${aws_subnet.private_subnet2.id}"
}

output "sg" {
    value = "${aws_security_group.sg.id}"
}
