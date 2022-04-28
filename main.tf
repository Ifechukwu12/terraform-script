
resource "aws_security_group" "terra_sg" {
  name        = "custom http"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "Inbound Rule"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Out bound rule"
  }
}
terraform {
  backend "s3" {
    bucket = "terraform-bucketw"
    key    = "tf.state"
    region = "us-east-2"
  }
}

module "my_database" {
  source = "./modules/database"
  name   = "promise"
}

module "my_vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.5.0.0/16"
}

