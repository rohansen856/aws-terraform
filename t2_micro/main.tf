terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region="ap-south-1"
  access_key="AKIAWFTUHDAD22B5TJJP"
  secret_key="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"
}

resource "aws_instance" "first_server" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"

  tags = {
    Name = "Hello"
  }
}