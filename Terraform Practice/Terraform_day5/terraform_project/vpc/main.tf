provider "aws" {
    region = "us-east-1"
  
}
variable "cidr" {
    default =  "10.0.0.0/24"
}

resource "aws_key_pair" "example_key" {
    key_name = "terraform_key"
    public_key = file("/Users/krishna/Desktop/public.pem")

  
}
resource "aws_vpc" "krishna_vpc" {
    cidr_block = var.cidr
  
}

resource "aws_subnet" "subnet_id" {
    vpc_id = "aws_vpc.krishna_vpc.id"
    cidr_block = "10.0.0.0/25"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
  
}

resource "aws_internet_gateway" "krishna_internet_gateway" {
    vpc_id = aws_vpc.krishna_vpc.id
}


resource "aws_route_table" "krishna_route_table" {
    vpc_id = aws_vpc.krishna_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.krishna_internet_gateway.id

    }
}
resource "aws_route_table_association" "krishna_route_table_associations" {
    subnet_id =aws_subnet.subnet_id.id
    route_table_id = aws_route_table.krishna_route_table.id
}

resource "aws_security_group" "krisha_security_gropus" {
    name="web"
    vpc_id = aws_vpc.krishna_vpc.id
    ingress {
        description = "Http form vpc"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        name="web_sg"
        
    }
  
}
