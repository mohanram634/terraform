#----root/terraform.tfvars-------

region = "us-east-1"
cidr_block = "12.0.0.0/16"
public_subnet1 = "12.0.1.0/24"
public_subnet2 = "12.0.2.0/24"
private_subnet1 = "12.0.3.0/24"
private_subnet2 = "12.0.4.0/24"
public_az1 = "us-east-1a"
public_az2 = "us-east-1b"
private_az1 = "us-east-1c"
private_az2 = "us-east-1d"
key_name = "mykeyname"
public_key_path= "/home/ec2-user/.ssh/id_rsa.pub"
ami_id = "ami-0b69ea66ff7391e80"
instance_type = "t2.micro"
instance_count = "2"




