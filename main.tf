resource "aws_instance" "my_instance" {
  ami                     = "ami-0557a15b87f6559cf"
  instance_type           = "t2.micro"
  tags ={
    Name ="ec2_instance"
}
}

provider "aws" {
  region     = "us-east-1"
 
}

  resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  tags = {
    Name: var.tag
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.mybucket #bootcamp30-9-bush

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
provider "aws" {
  region  = "us-east-1"
}
variable "tag" {
    description="give a tag to kms_key"
    type= string
    default= "kms_key_enoh"
  
}
variable "mybucket" {
 description= "give a name to your s3_bucket"
 type =string
 default= "bootcamp30-9-enoh"

  
}