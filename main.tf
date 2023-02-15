terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
region= "ap-south-1"
access_key = var.accesskey
secret_key = var.secretkey
}


module "web" {

source= "./modules/webmodule/"
subnet_id= module.vpc.websubnet_id
vpc_id= module.vpc.vpc_id
}
module "app" {

source= "./modules/appmodule/"
subnet_id= module.vpc.appsubnet_id
vpc_id= module.vpc.vpc_id
sgid= [module.web.websgid]
}

module "db" {

source= "./modules/dbmodule/"

subnet_id= module.vpc.dbsubnet_id
vpc_id= module.vpc.vpc_id
sgid= [module.app.appsgid]
}

module "vpc" {

source= "./modules/vpcmodule/"


}


