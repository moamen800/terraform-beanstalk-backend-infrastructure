output "elb_sg_id" {
  description = "ID of the ELB security group"
  value       = aws_security_group.elb.id
}

output "beanstalk_sg_id" {
  description = "ID of the Beanstalk security group"
  value       = aws_security_group.beanstalk.id
}

output "backend_sg_id" {
  description = "ID of the backend security group"
  value       = aws_security_group.backend.id
}

output "bastion_sg_id" {
  description = "ID of the bastion security group"
  value       = aws_security_group.bastion.id
}
