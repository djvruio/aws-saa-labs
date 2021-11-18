output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.linux_instance_for_ami.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.linux_instance_for_ami.public_ip
}