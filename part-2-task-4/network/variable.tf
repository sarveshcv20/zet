variable "region" {
    description="AWS region used"
    default="us-east-1"
}
variable "vpc_name" {
    default="test-vpc-v1"
}
variable "environment" {
    default="test"
}
variable "cidr" {
    default="10.16.0.0/16"
}
variable "availability_zones" {
    type = "list"
    default = ["us-east-1a", "us-east-1b"]
}
variable "public_subnets_cidr" {
    type="list"
    default=["10.16.100.0/24"]
}

variable "private_subnets_cidr" {
    type="list"
    default=["10.16.200.0/24"]
}


