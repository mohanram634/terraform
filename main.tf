#------root/maintf------

provider "aws" {
  region  = "${var.region}"
}

module "vpc" {
    source = "./vpc"
    cidr_block = "${var.cidr_block}"
    public_subnet1 = "${var.public_subnet1}"
    public_subnet2 = "${var.public_subnet2}"
    public_az1 = "${var.public_az1}"
    public_az2 = "${var.public_az2}"
    private_az1 = "${var.private_az1}"
    private_az2 = "${var.private_az2}"
    
}


module "ec2" {
  source = "./ec2"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  ami_id = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  instance_count = "${var.instance_count}"
  subnet_id = "${module.vpc.PrivateSubnet1}"
  security_group = "${module.vpc.sg}"
}