
resource "aws_security_group" "main" {
  name        = "${var.environment}-db-sg"
  description = "db security group "
  vpc_id      = "${var.vpc_id}"
  ingress {
    description = "MySQL Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.16.0.0/16"]
  }
    ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Environment = "${var.environment}"
  }
}
