provider "aws" {
    region = "us-east-1"
  
}
module "ec2_example" {
    source = "/Users/krishna/Desktop/Terraform Practice/Terraform_day3/terraform/ec2_example"
    ami_value="ami-04b70fa74e45c3917"
    instance_type_value="t2.micro"
}
