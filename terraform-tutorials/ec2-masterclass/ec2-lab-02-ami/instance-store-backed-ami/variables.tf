variable "instance_name_linux" {
  description = "Value of the Name tag for the EC2 linux instance"
  type        = string
  default     = "LinuxInstanceForAMI"
}

variable "ami_id_linux" {
    description = "Value of Amazon Linux 2 AMI for ARM free tier"
    type =  string
    default = "ami-0d1a4d53e40abecc4" # x86 = "ami-0dd0ccab7e2801812"
}

variable "instance_type_linux" {
    description = "Value of Linux Instance Type"
    type =  string
    default = "t4g.micro" # x86 = "t2.micro"
}

variable "instance_owner" {
    type =  string
    default = "djvruio@gmail.com"
}
