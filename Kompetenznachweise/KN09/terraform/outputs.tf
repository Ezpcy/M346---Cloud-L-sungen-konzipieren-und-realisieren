output "instance_id" {
  description = "ID of the database server instance"
  value       = aws_instance.database_server.id
}

output "public_ip" {
  description = "Public IP address of the database server"
  value       = aws_instance.database_server.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.db_sg.id
}
