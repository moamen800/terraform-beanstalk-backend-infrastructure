variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "backend_sg_id" {
  description = "Backend security group ID"
  type        = string
}
