variable "ami_value" {
    description = "This is for ami value"
}
variable "instance_type_value" {
    default = {
        "dev"="t2.micro"
        "stag"="t2.medium"
        "prod"= "t2.xlarge"
    }
}


