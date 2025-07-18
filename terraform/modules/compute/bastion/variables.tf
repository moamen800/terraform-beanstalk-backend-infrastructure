variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of bastion instances"
  type        = number
}

variable "keyname" {
  description = "Key pair name"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Bastion security group ID"
  type        = string
}

variable "db_template_path" {
  description = "Path to database deployment template"
  type        = string
}

variable "rds_endpoint" {
  description = "RDS database endpoint"
  type        = string
}

variable "dbuser" {
  description = "Database username"
  type        = string
}

variable "dbpassword" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "username" {
  description = "SSH username for bastion host"
  type        = string
}

variable "private_keypath" {
  description = "Path to private key file"
  type        = string
}

variable "rds_instance" {
  description = "RDS instance resource for dependency"
  type        = any
}
