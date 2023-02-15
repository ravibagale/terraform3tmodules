
output "vpc_id" {
value= aws_vpc.example_vpc.id
}


output "websubnet_id" {
value= aws_subnet.example_public_subnet_a.id
}






output "appsubnet_id" {
value= aws_subnet.example_pvt_subnet_b.id
}


output "dbsubnet_id" {
value= aws_subnet.example_private_subnet_a.id
}



