output "rds_endpoint" {
  description = "RDS MySQL database endpoint"
  value       = aws_db_instance.main.endpoint
}

output "rds_port" {
  description = "RDS MySQL database port"
  value       = aws_db_instance.main.port
}

output "rds_database_name" {
  description = "RDS MySQL database name"
  value       = aws_db_instance.main.db_name
}

output "rds_instance" {
  description = "RDS instance resource"
  value       = aws_db_instance.main
}
