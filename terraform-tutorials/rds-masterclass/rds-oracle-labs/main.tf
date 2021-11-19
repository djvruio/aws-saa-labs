provider "aws" {
    region = var.region
}

data "aws_availability_zones" "available" {
  
}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.77.0"

  name                 = "oracle-rds"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name  = "Oracle-RDS-Lab"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_db_subnet_group" "oracle-rds-db-sng" {
  name       = "oracle-rds-db-sng"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name  = "Oracle-RDS-Lab"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_security_group" "oracle_rds_seg" {
  name   = "oracle_rds_seg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Description of ingress rule 1521 outside VPC (risk)"
  }

  egress {
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Description of egress rule 1521 (risk)"
  }

 tags = {
    Name  = "Oracle-RDS-Lab"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_db_parameter_group" "oracle_rds_pg" {
  name   = "oracle-rds-pg"
  family = "oracle-ee-19"

  #parameter {
  #  name  = "log_connections"
  #  value = "1"
  # }

  tags = {
    Name  = "Oracle-RDS-Lab"
    Owner = "djvruio@gmail.com"
  }
}

resource "aws_db_instance" "mydatabase" {
  
  identifier             = "mydatabase"
  instance_class         = "db.m5.xlarge"
  engine                 = var.engine
  engine_version         = var.engine_version
  license_model          = "bring-your-own-license"

  allocated_storage      = 20
  max_allocated_storage = 100
  storage_encrypted     = false
  multi_az              = false

  name                   = "ORCL"
  username               = "oraadmin"
  password               = var.db_password
  port                   = 1521

  backup_retention_period = 0
  skip_final_snapshot    = true
  deletion_protection = false
  db_subnet_group_name   = aws_db_subnet_group.oracle-rds-db-sng.name
  vpc_security_group_ids = [aws_security_group.oracle_rds_seg.id]
  parameter_group_name   = aws_db_parameter_group.oracle_rds_pg.name
  publicly_accessible    = true
  character_set_name     = "AL32UTF8"

  tags = {
    Name  = "Oracle-RDS-Lab"
    Owner = "djvruio@gmail.com"
  }
}