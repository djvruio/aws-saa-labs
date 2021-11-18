variable "region" {
  default = "us-east-2"
  description = "AWS Region - Ohio"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive = true
}