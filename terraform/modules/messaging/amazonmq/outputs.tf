output "amazonmq_broker_id" {
  description = "Amazon MQ broker ID"
  value       = aws_mq_broker.main.id
}

output "amazonmq_broker_arn" {
  description = "Amazon MQ broker ARN"
  value       = aws_mq_broker.main.arn
}

output "amazonmq_broker_endpoint" {
  description = "Amazon MQ broker endpoint"
  value       = aws_mq_broker.main.instances[0].endpoints[0]
}
