provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "aws_bucket" {
  bucket = "sai-897807-terraform-bucket"
}
