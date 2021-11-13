terraform {

  # specifies all of the providers required by the current module
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
  region  = "us-east-2" #ohio

}

#         <type>         <local-name>
resource "aws_instance" "linux_test_server" {
  
  ami           = var.ami_id_linux
  instance_type = var.instance_type_linux
  key_name = "KeyPairForEC2TestingInstances"

  tags = {
    Name = var.instance_name_linux
    Owner = var.instance_owner
  }
}

resource "aws_instance" "windows_test_server" {
  
  ami           = var.ami_id_windows
  instance_type = var.instance_type_windows
  key_name = "KeyPairForEC2TestingInstances"

  tags = {
    Name = var.instance_name_windows
    Owner = var.instance_owner
  }
}
