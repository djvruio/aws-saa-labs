terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27" # current aws plugin is version 3.65.0
    }
  }

  required_version = ">= 1.0.9" # current terraform version is 1.0.11

}

provider "aws" {
  
  profile = "default"
  region  = "us-east-1" #virginia

}

resource "aws_instance" "linux_instance_for_ami" {
  
  ami           = var.ami_id_linux
  instance_type = var.instance_type_linux
  key_name      = "KeyPairForEC2TestingInstancesVirginia"
  user_data = "${file("install_apache.sh")}"

  tags = {
    Name  = var.instance_name_linux
    Owner = var.instance_owner
  }
}
