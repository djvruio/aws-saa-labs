variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "TestAppServerInstance"
}

variable "ami_id" {
    description = "Value of Amazon Linux 2 AMI for ARM free tier"
    type =  string
    default = "ami-077cfbfe93cf8b059" # x86 = "ami-0dd0ccab7e2801812"
}

variable "instance_type" {
    description = "Value of Instance Type"
    type =  string
    default = "t4g.micro" # x86 = "t2.micro"
}

variable "instance_owner" {
    type =  string
    default = "djvruio@gmail.com"
}
