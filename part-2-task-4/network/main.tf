module "vpc_creation" {
source               = "../modules/vpc" 
cidr                 = "${var.cidr}"
name                 = "${var.vpc_name}"
environment          = "${var.environment}"
}

module "app_sg_creation" {
source               = "../modules/app-sg" 
environment          = "${var.environment}"
vpc_id               = "${module.vpc_creation.vpc_id}"
}

module "db_sg_creation" {
source               = "../modules/db-sg" 
environment          = "${var.environment}"
vpc_id               = "${module.vpc_creation.vpc_id}"
}

module "public_subnet_creation" {
source               = "../modules/public-subnet" 
environment          = "${var.environment}"
vpc_id               = "${module.vpc_creation.vpc_id}"
public_subnets_cidr  = ["${var.public_subnets_cidr}"]
availability_zones    = ["${var.availability_zones}"]
}

module "private_subnet_creation" {
source               = "../modules/private-subnet" 
environment          = "${var.environment}"
vpc_id               = "${module.vpc_creation.vpc_id}"
private_subnets_cidr  = ["${var.private_subnets_cidr}"]
availability_zones    = ["${var.availability_zones}"]
public_subnets_ids    = "${module.public_subnet_creation.public_subnet_ids}"
}

