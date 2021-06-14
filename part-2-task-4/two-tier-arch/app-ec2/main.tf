module "app-tier"{
  source = "../../modules/ec2"
  instance_ami = "${var.instance_ami}"
  availability_zone = "${var.availability_zone}"
  instance_type = "${var.instance_type}"
  aws_security_group_id = ["${var.aws_security_group_id}"]
  subnet_id = "${var.subnet_id}"
  root_device_size = "${var.root_device_size}"
  root_device_type = "${var.root_device_type}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key = "${var.key}"
  workload = "app"
}
