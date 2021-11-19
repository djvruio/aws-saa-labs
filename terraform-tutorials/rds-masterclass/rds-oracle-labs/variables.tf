variable "region" {
  type = string
  default = "us-east-1"
  description = "AWS Region Virginia."
  # validation {}
  # sensitive = true/false
}

variable "engine" {
  default = "oracle-ee"
}

variable "engine_version" {
  default = "19.0.0.0.ru-2021-07.rur-2021-07.r1"
}

variable "db_password" {
  description = "RDS root user password"
  default = "hashicorp"
  sensitive = true
}