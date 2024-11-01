provider "aws"{
    region="us-east-1"
}

resource "aws_instance" "example" {
    ami           = "ami-04b70fa74e45c3917"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
}
