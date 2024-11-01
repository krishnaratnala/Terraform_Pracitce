#input variable 
variable "instance_type"{
    description="EC2 instance type"
    type=string
    default="t2.micro"
}
variable "ami_id"{
    description ="Ec2 AMI ID"
    type = string
}
provider "aws"{
    region="us-east-1"
}
resource "aws_instance" "example_instance"{
    ami=var.ami_id
    instance_type=var.instance_type

}
#output variables
output "public_ip"{
    description="public ip adress for ec2 instance"
    value=aws_instance.example_instance.public_ip
}