# ===================================
# RDS DATABASE CONFIGURATION
# ===================================

# ---------------------
# Database Subnet Group
# ---------------------

# RDS Database Subnet Group
resource "aws_db_subnet_group" "main" {
  name        = "${var.project_name}-db-subnet-group"
  description = "DB subnet group for ${var.project_name}"
  subnet_ids  = var.private_subnets

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}

# ----------------
# Database Instance
# ----------------

# RDS Database Instance
resource "aws_db_instance" "main" {
  identifier             = "${var.project_name}-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.backend_sg_id]

  tags = {
    Name        = "${var.project_name}-db-instance"
    Environment = var.environment
    Project     = var.project_name
  }
}
