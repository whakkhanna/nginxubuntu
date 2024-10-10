provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "nginx" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  tags = {
      Name = "nginx"
  }

