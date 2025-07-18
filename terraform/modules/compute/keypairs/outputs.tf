output "key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.keypair_ssh.key_name
}

output "key_pair_id" {
  description = "ID of the SSH key pair"
  value       = aws_key_pair.keypair_ssh.key_pair_id
}
