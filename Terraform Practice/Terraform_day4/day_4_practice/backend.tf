terraform {
  backend "s3" {
    bucket="sai-897807-terraform-bucket"
    region="us-east-1"
    key="krishna_instance/terraform.tfstate"
    
  }
}