#
# DO NOT DELETE THESE LINES UNTIL INSTRUCTED TO!
#
# Your AMI ID is:
#
#     ami-925144f2
#
# Your subnet ID is:
#
#     subnet-987a1ac3
#
# Your VPC security group ID is:
#
#     sg-3f782146
#
# Your Identity is:
#
#     Hashi-032618-sparrow
#

# access_key        = "AKIAJ3KJITHLO3O7Y6UQ"
# secret_key        = "XP9E+51dEsN6xFgB3e67dg+cPRQ+cqpiP/VjKZqe"
# region            = "us-west-1"
# ami               = "ami-925144f2"
# subnet_id         = "subnet-987a1ac3"
# identity          = "Hashi-032618-sparrow"
# vpc_security_group_id = "sg-3f782146"

variable "ami" {}
variable "subnet_id" {}
variable "vpc_security_group_id" {}
variable "instance_type" {}
variable "identity" {}
variable "access_key" {}
variable "secret_key" {}
variable "region" {}


provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


### ADD

module "server" {
  source = "./server"

  ami                   = "${var.ami}"
  subnet_id             = "${var.subnet_id}"
  vpc_security_group_id = "${var.vpc_security_group_id}"
  identity              = "${var.identity}"
  instance_type         = "${var.instance_type}"
}

output "public_ip" {
  value = "${module.server.public_ip}"
}


