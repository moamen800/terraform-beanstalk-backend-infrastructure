variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "env_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name"
  type        = string
}

variable "cname_prefix" {
  description = "CNAME prefix for Elastic Beanstalk environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "keyname" {
  description = "Key pair name"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in ASG"
  type        = string
}

variable "max_size" {
  description = "Maximum number of instances in ASG"
  type        = string
}

variable "rds_endpoint" {
  description = "RDS database endpoint"
  type        = string
}

variable "dbname" {
  description = "Database name"
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

variable "memcached_endpoint" {
  description = "ElastiCache Memcached endpoint"
  type        = string
}

variable "rmq_endpoint" {
  description = "Amazon MQ RabbitMQ endpoint"
  type        = string
}

variable "rmq_username" {
  description = "RabbitMQ username"
  type        = string
}

variable "rmq_password" {
  description = "RabbitMQ password"
  type        = string
  sensitive   = true
}

variable "beanstalk_sg_id" {
  description = "Beanstalk security group ID"
  type        = string
}

variable "elb_sg_id" {
  description = "ELB security group ID"
  type        = string
}

variable "rds_instance" {
  description = "RDS instance resource for dependency"
  type        = any
}

variable "elasticache_cluster" {
  description = "ElastiCache cluster resource for dependency"
  type        = any
}

variable "amazonmq_broker" {
  description = "Amazon MQ broker resource for dependency"
  type        = any
}
