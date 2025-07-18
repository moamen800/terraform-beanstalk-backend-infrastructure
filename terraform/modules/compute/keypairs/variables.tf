variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "key_name" {
  description = "Name for the SSH key pair"
  type        = string
  default     = "keypair_ssh"
}
