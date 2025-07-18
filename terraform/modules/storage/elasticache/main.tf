# ===================================
# ELASTICACHE CONFIGURATION
# ===================================

# -----------------
# Cache Subnet Group
# -----------------

# ElastiCache Subnet Group
resource "aws_elasticache_subnet_group" "main" {
  name        = "${var.project_name}-elasticache-subnet-group"
  description = "Elasticache subnet group for ${var.project_name}"
  subnet_ids  = var.private_subnets

  tags = {
    Name        = "${var.project_name}-elasticache-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}

# -------------
# Cache Cluster
# -------------

# ElastiCache Cluster
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.project_name}-memcached"
  engine               = "memcached"
  engine_version       = "1.6.22"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  security_group_ids   = [var.backend_sg_id]

  tags = {
    Name        = "${var.project_name}-memcached"
    Environment = var.environment
    Project     = var.project_name
  }
}
