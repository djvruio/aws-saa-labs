
# configure Terraform behaviours

terraform {

# specifies all of the providers required by the current module

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.66.0"
    }
  }

 # applies only to the version of Terraform CLI.
 
 required_version = ">=1.0.9"
}