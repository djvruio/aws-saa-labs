variable "instance_name_linux" {
  description = "Value of the Name tag for the EC2 linux instance"
  type        = string
  default     = "TestLinuxInstance"
}

variable "instance_name_windows" {
  description = "Value of the Name tag for the EC2 windows instance"
  type        = string
  default     = "TestWindowsInstance"
}

variable "ami_id_linux" {
    description = "Value of Amazon Linux 2 AMI for ARM free tier"
    type =  string
    default = "ami-077cfbfe93cf8b059" # x86 = "ami-0dd0ccab7e2801812"
}

variable "ami_id_windows" {
    description = "Value of Windows 2022 Base AMI for free tier"
    type =  string
    default = "ami-0ca01218448f9d4fe"
}

variable "instance_type_linux" {
    description = "Value of Linux Instance Type"
    type =  string
    default = "t4g.micro" # x86 = "t2.micro"
}

variable "instance_type_windows" {
    description = "Value of Windows Instance Type"
    type =  string
    default = "t2.micro"
}

variable "instance_owner" {
    type =  string
    default = "djvruio@gmail.com"
}
