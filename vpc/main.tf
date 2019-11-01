#-----vpc/main.tf-------

resource "aws_vpc" "vpc" {
    cidr_block = "${var.cidr_block}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags {
        Name = "Devlopment-Vpc"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "InternetGateway"
  }
}


#----PUBLIC_SUBNET----

resource "aws_subnet" "public_subnet1" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.public_subnet1}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.public_az1}"
  tags = {
    Name = "PublicSubnet1"
  }
}


resource "aws_subnet" "public_subnet2" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.public_subnet2}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.public_az2}"
  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

}


resource "aws_route_table_association" "public1_asc" {
  subnet_id      = "${aws_subnet.public_subnet1.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}


resource "aws_route_table_association" "public2_asc" {
  subnet_id      = "${aws_subnet.public_subnet2.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}



#-----PRIVATE_SUBNET--------

resource "aws_subnet" "private_subnet1" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.private_subnet1}"
  availability_zone = "${var.private_az1}"
  tags = {
    Name = "PrivateSubnet1"
  }
}


resource "aws_subnet" "private_subnet2" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.private_subnet2}"
  availability_zone = "${var.private_az2}"
  tags = {
    Name = "PrivateSubnet1"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = "${aws_vpc.vpc.id}"
}


resource "aws_route_table_association" "private1_asc" {
  subnet_id      = "${aws_subnet.private_subnet1.id}"
  route_table_id = "${aws_route_table.private_route.id}"
  
}

resource "aws_route_table_association" "private2_asc" {
  subnet_id = "${aws_subnet.private_subnet2.id}"
  route_table_id = "${aws_route_table.private_route.id}"
}

resource "aws_security_group" "sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    # SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # HTTP
    from_port = 80
    to_port = 80
    protocol ="tcp"
   }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
      }
}
  

