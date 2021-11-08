
# tf settings
# tf installs providers (plugins) from Terraform Registry by default
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

# define a component of the infrastructure
# ami-0629230e074c580f2 Ubuntu
# ami-0f19d220602031aed Amazon Linux 2
resource "aws_instance" "app_server" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
