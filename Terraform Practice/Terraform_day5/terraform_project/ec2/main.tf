provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "krishna_instance"{
    ami ="ami-04b70fa74e45c3917"  
    instance_type = "t2.micro"
    key_name = aws_key_pair.example_key.key_name
    vpc_security_group_ids = [aws_security_group.krisha_security_gropus.web.id]
    subnet_id = aws_subnet.krishna_subnet.id

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "/Users/krishna/Desktop/krishna_keypair.pem"
      host = self.public_ip
    }

    #file provisioners to copy a file from local to the remote ec2 intstance
    provisioner "file" {
        source = "/Users/krishna/Desktop/Terraform Practice/Terraform_day5/app/app.py"
        destination = "/home/ubunut//Users/krishna/Desktop/Terraform Practice/Terraform_day5/app/app.py"
      
    }
    provisioner "remote-exec" {

        inline = [ 
            "echo 'Hello from remote instance' ",
            "sudo apt update-y",#updating packages list fro ubuntu
            "sudo apt-get install -y  python3-pip ",#package installation
            "cd /home/ubunut//Users/krishna/Desktop/Terraform Practice/Terraform_day5/app/app.py",
            "sudo pip3 install flask",
            "sudo python3 app.py &",
         ]
      
    }


}  
