# ===================================
# AMAZON MQ CONFIGURATION
# ===================================

# ---------------
# RabbitMQ Broker
# ---------------

# Amazon MQ (RabbitMQ) Broker
resource "aws_mq_broker" "main" {
  broker_name                = "${var.project_name}-rabbitmq"
  engine_type                = "RabbitMQ"
  engine_version             = "3.13"
  host_instance_type         = var.instance_type
  publicly_accessible        = false
  auto_minor_version_upgrade = true
  security_groups            = [var.backend_sg_id]
  subnet_ids                 = [var.private_subnets[0]]

  user {
    username = var.rmq_username
    password = var.rmq_password
  }

  tags = {
    Name        = "${var.project_name}-rabbitmq"
    Environment = var.environment
    Project     = var.project_name
  }
}
