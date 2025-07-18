# ==========================================
# AWS CONFIGURATION
# ==========================================

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

# ==========================================
# SECURITY CONFIGURATION
# ==========================================

variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH to bastion host"
  type        = list(string)
}

# ==========================================
# SSH KEY CONFIGURATION
# ==========================================

variable "Priv_Key_Path" {
  description = "value for private key path"
  default     = "keypair_ssh"
}

variable "Pub_Key_Path" {
  description = "value for public key path"
  default     = "keypair_ssh.pub"
}

# ==========================================
# BASTION HOST CONFIGURATION
# ==========================================

variable "bastion_instance_type" {
  description = "Instance type for bastion host"
  type        = string
}

# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

# Bastion Host Variables
variable "username" {
  description = "value for username"
  type        = string
}

variable "instance_type" {
  description = "Instance type for bastion host"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}

# Amazon MQ Variables
variable "mq_username" {
  description = "Username for RabbitMQ broker"
  type        = string
}

variable "mq_password" {
  description = "Password for RabbitMQ broker"
  type        = string
  sensitive   = true
}

# RDS Variables
variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for database"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for database"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage for database in GB"
  type        = number
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

# ElastiCache Variables
variable "elasticache_node_type" {
  description = "ElastiCache node type"
  type        = string
}

variable "elasticache_num_nodes" {
  description = "Number of ElastiCache nodes"
  type        = number
}

# Amazon MQ Additional Variables
variable "rmq_username" {
  description = "RabbitMQ username"
  type        = string
}

variable "rmq_password" {
  description = "RabbitMQ password"
  type        = string
  sensitive   = true
}

variable "amazonmq_instance_type" {
  description = "Amazon MQ instance type"
  type        = string
}

# Bastion Host Additional Variables
variable "bastion_instance_count" {
  description = "Number of bastion instances"
  type        = number
}

variable "db_template_path" {
  description = "Path to database deployment template"
  type        = string
}

variable "ssh_username" {
  description = "SSH username for bastion host"
  type        = string
}

variable "private_keypath" {
  description = "Path to private key file"
  type        = string
}

# Elastic Beanstalk Variables
variable "beanstalk_app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "beanstalk_env_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "beanstalk_solution_stack" {
  description = "Elastic Beanstalk solution stack name"
  type        = string
}

variable "beanstalk_cname_prefix" {
  description = "CNAME prefix for Elastic Beanstalk environment"
  type        = string
}

variable "beanstalk_instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string
}

variable "beanstalk_min_size" {
  description = "Minimum number of instances in ASG"
  type        = string
}

variable "beanstalk_max_size" {
  description = "Maximum number of instances in ASG"
  type        = string
}
