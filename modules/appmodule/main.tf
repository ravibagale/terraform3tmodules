variable "subnet_id" {}
variable "vpc_id" {}

variable "sgid" {}

resource "aws_security_group" "example_php_security_group" {
  name = "example_php_security_group"
  description = "Allow traffic from web servers"
  vpc_id = var.vpc_id
  ingress {
    from_port = 9000
    to_port = 9000
    protocol = "tcp"
    security_groups = var.sgid
  }
}

resource "aws_instance" "example_php_server" {
ami = "ami-0cca134ec43cf708f"
instance_type = "t2.micro"
subnet_id = var.subnet_id
tags = {
Name = "example_php_server"
}
security_groups = [aws_security_group.example_php_security_group.id]
}

output "appsgid" {

value= aws_security_group.example_php_security_group.id
}

#module "vpc" {

#source = "../vpcmodule"
#}

#module "web" {

#source = "../webmodule"
#}

