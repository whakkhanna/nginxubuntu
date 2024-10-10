provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "nginx" {
  ami           = "ami-0edab43b6fa892279"
  instance_type = "t2.micro"
  tags = {
      Name = "nginx"
      description = "Nginx server on ubuntu"
  }
user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install nginx -y
            systemctl enable nginx
            systemctl start nginx
            EOF
}

output publicip {
  value   = aws_instance.webserver.public_ip
}

