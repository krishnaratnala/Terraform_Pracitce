provider "aws" {
    region = "us-east-1"
}
variable "instance_type_value" {
    description = "This is fro instance type value"
    type = map(string)
    default = {
      "dev" = "t2.micro"
      "stag"="t2.medium"
      "prod"="t2.xlarge"
    }
  
}
module "ec2_instance" {
    source = "/Users/krishna/Desktop/All/Terraform Practice/Terraform_day6/modules/ec2instance"
    ami="ami-04b70fa74e45c3917"
    instance_type_value=lookup(instance_type_value,Terraform.workspace,"t2.micro")
  
}