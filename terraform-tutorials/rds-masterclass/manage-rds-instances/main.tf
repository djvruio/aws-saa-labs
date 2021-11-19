provider "aws" {
    region = var.region
}

# data sources allow Terraform use information define outside of Terraform, defined
# by another separate Terraform configuration, or modified by functions

# The Availability Zones data source allows access to the list of AWS Availability Zones
# which can be accessed by an AWS account within the region configured in the provider.
# In this case:
# us-east-2a  AZID = use2-az1
# us-east-2b  AZID = use2-az2
# us-east-2c  AZID = use2-az3
data "aws_availability_zones" "available" {
  
}

# A module is a container for multiple resources that are used together.
# A module can call other modules
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws" #remote source
  version              = "2.77.0"

  name                 = "education"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# Each resource block describes one or more infrastructure objects, 
# such as virtual networks, compute instances, or higher-level components such as DNS records.
resource "aws_db_subnet_group" "education" {
  name       = "education"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name  = "Education"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_security_group" "rds" {
  name   = "education_rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Description of ingress rule 5432"
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Description of egress rule 5432"
  }

  tags = {
    Name = "education_rds"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_db_parameter_group" "education" {
  name   = "education"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

# Provides an RDS instance resource. A DB instance is an isolated database environment in the cloud.
# A DB instance can contain multiple user-created databases.
# Amazon RDS supports three types of instance classes:
# Standard (General purpose: m6g, m5d, m5, m4, m3) 
# Memory Optimized (r5, r6, x, z)
# and Burstable Performance. (t4, t3, t2)
# Engines
# Microsoft SQL Server, Oracle, MySQL, Maria DB, Postgres
# Aurora PostgresSQL, Aurora MySQL
resource "aws_db_instance" "education" {
  identifier             = "education"
  instance_class         = "db.t3.micro"
  #allocated_storage      = 5
  allocated_storage      = 10
  backup_retention_period = 1 # The days to retain backups for. Between 0 and 35.
                              # Must be greater than 0 if the database is used as a source for a Read Replica.
  apply_immediately      = true
  engine                 = "postgres" 
  engine_version         = "13.1"
  username               = "edu"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

# Provision a read replica
resource "aws_db_instance" "education_replica" {
  name                   = "education-replica"
  identifier             = "education-replica"
  instance_class         = "db.t3.micro"
  replicate_source_db    = aws_db_instance.education.identifier
  # backup_retention_period = 1
  apply_immediately      = true
  publicly_accessible    = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.education.name

depends_on = [
  aws_db_instance.education
]

}