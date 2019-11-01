#-------ec2/main.tf--------

resource "aws_key_pair" "devkeypair" {
    key_name   = "${var.key_name}"
    public_key = "${file(var.public_key_path)}"
    
}

resource "aws_instance" "myserver" {
  count = "${var.instance_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.devkeypair.id}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id = "${var.subnet_id}"
  
    
}
  
  
