output "beanstalk_app_name" {
  description = "Elastic Beanstalk application name"
  value       = aws_elastic_beanstalk_application.vprofile-prod.name
}

output "beanstalk_env_name" {
  description = "Elastic Beanstalk environment name"
  value       = aws_elastic_beanstalk_environment.vprofile-bean-prod.name
}

output "beanstalk_endpoint_url" {
  description = "Elastic Beanstalk environment endpoint URL"
  value       = aws_elastic_beanstalk_environment.vprofile-bean-prod.endpoint_url
}

output "beanstalk_cname" {
  description = "Elastic Beanstalk environment CNAME"
  value       = aws_elastic_beanstalk_environment.vprofile-bean-prod.cname
}
