variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
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

variable "instance_type" {
  description = "Amazon MQ instance type"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "backend_sg_id" {
  description = "Backend security group ID"
  type        = string
}
