provider "aws" {
region= "ap-south-1"
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


