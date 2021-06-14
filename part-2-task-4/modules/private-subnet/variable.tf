variable "environment" {
}

variable "vpc_id" {
}

variable "private_subnets_cidr" {
    type="list"
}

variable "availability_zones" {
    type="list"
}
variable "public_subnets_ids" {
    type="list"
}