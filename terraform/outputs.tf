# ==========================================
# TERRAFORM OUTPUTS
# ==========================================

# Data Services Endpoints
output "rds_endpoint" {
  description = "RDS MySQL database endpoint"
  value       = module.rds.rds_endpoint
}

output "elasticache_endpoint" {
  description = "ElastiCache Memcached cluster endpoint"
  value       = module.elasticache.elasticache_endpoint
}

output "amazonmq_endpoint" {
  description = "Amazon MQ RabbitMQ broker endpoints"
  value       = module.amazonmq.amazonmq_broker_endpoint
}