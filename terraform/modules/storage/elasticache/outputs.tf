output "elasticache_endpoint" {
  description = "ElastiCache Memcached cluster endpoint"
  value       = aws_elasticache_cluster.main.cluster_address
}

output "elasticache_port" {
  description = "ElastiCache Memcached cluster port"
  value       = aws_elasticache_cluster.main.port
}

output "memcached_endpoint" {
  description = "ElastiCache Memcached cluster endpoint (alias)"
  value       = aws_elasticache_cluster.main.cluster_address
}

output "elasticache_cluster" {
  description = "ElastiCache cluster resource"
  value       = aws_elasticache_cluster.main
}
