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