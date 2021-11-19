# Learn Terraform - Manage AWS RDS

This is a companion repository for the [Manage RDS Instances
guide](https://learn.hashicorp.com/tutorials/terraform/aws-rds) on [HashiCorp
Learn](https://learn.hashicorp.com/). It contains Terraform conifguration files
for you to use to learn how to provision and manage AWS RDS resources using
Terraform.

# RDS

Provides an RDS instance resource. A DB instance is an isolated database environment in the cloud.
A DB instance can contain multiple user-created databases.
Amazon RDS supports three types of instance classes:

1. Standard (General purpose: m6g, m5d, m5, m4, m3) 
2. Memory Optimized (r5, r6, x, z)
3. and Burstable Performance. (t4, t3, t2)

## Engines

1. Microsoft SQL Server
2. Oracle
3. MySQL
4. Maria DB
5. Postgres
6. Aurora PostgresSQL and Aurora MySQL

## Connect to db instance with Oracle SQL Developer

Name: Whatever you want (Ex. RDS Connection)

Database Type (PostgreSQL)

Username 

Password

Hostname {Endpoint from AWS RDS}/postgres?

Port 5432

## Postgres SQL Sentences
``` sql
CREATE DATABASE hashicorp;
SELECT datname FROM pg_database;
```

## RDS Labs

[Labs to RDS](https://rdsora.workshop.aws/)