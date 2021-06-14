resource "aws_instance" "instance" {
  ami                         = "${var.instance_ami}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  vpc_security_group_ids      = ["${var.aws_security_group_id}"]
  subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key}"
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = "${var.root_device_size}"
    volume_type           = "${var.root_device_type}"
  }
 
  tags = {
    "Name"                = "${var.workload}-instance"
  }
}
