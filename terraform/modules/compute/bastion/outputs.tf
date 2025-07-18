output "bastion_instance_id" {
  description = "Bastion host instance ID"
  value       = aws_instance.vprofile-bastion[*].id
}

output "bastion_public_ip" {
  description = "Bastion host public IP"
  value       = aws_instance.vprofile-bastion[*].public_ip
}

output "bastion_private_ip" {
  description = "Bastion host private IP"
  value       = aws_instance.vprofile-bastion[*].private_ip
}
