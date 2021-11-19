output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.mydatabase.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.mydatabase.arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.mydatabase.availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.mydatabase.endpoint
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = aws_db_instance.mydatabase.hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.mydatabase.id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = aws_db_instance.mydatabase.resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.mydatabase.status
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.mydatabase.name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.mydatabase.username
  sensitive   = true
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = aws_db_instance.mydatabase.password
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.mydatabase.port
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = aws_db_subnet_group.oracle-rds-db-sng.name
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = aws_db_subnet_group.oracle-rds-db-sng.arn
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = aws_db_parameter_group.oracle_rds_pg.id
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = aws_db_parameter_group.oracle_rds_pg.arn
}