# ==========================================
# MAIN TERRAFORM CONFIGURATION
# ==========================================

# Network - VPC
module "vpc" {
  source = "./modules/network/vpc"

  project_name    = var.project_name
  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

# Network - Security Groups
module "security" {
  source = "./modules/network/security"

  project_name    = var.project_name
  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  vpc_cidr        = var.vpc_cidr
  allowed_ssh_ips = var.allowed_ssh_ips
}

# Compute - Key Pairs
module "keypairs" {
  source = "./modules/compute/keypairs"

  project_name = var.project_name
  environment  = var.environment
}

# Storage - RDS
module "rds" {
  source = "./modules/storage/rds"

  project_name      = var.project_name
  environment       = var.environment
  db_instance_class = var.db_instance_class
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  private_subnets   = module.vpc.private_subnets
  backend_sg_id     = module.security.backend_sg_id
}

# Storage - ElastiCache
module "elasticache" {
  source = "./modules/storage/elasticache"

  project_name    = var.project_name
  environment     = var.environment
  node_type       = var.elasticache_node_type
  num_cache_nodes = var.elasticache_num_nodes
  private_subnets = module.vpc.private_subnets
  backend_sg_id   = module.security.backend_sg_id
}

# Messaging - Amazon MQ
module "amazonmq" {
  source = "./modules/messaging/amazonmq"

  project_name    = var.project_name
  environment     = var.environment
  rmq_username    = var.rmq_username
  rmq_password    = var.rmq_password
  instance_type   = var.amazonmq_instance_type
  private_subnets = module.vpc.private_subnets
  backend_sg_id   = module.security.backend_sg_id
}

# Compute - Bastion Host
module "bastion" {
  source = "./modules/compute/bastion"

  project_name     = var.project_name
  environment      = var.environment
  bastion_ami      = data.aws_ami.ubuntu.id
  instance_type    = var.bastion_instance_type
  instance_count   = var.bastion_instance_count
  keyname          = module.keypairs.key_name
  public_subnets   = module.vpc.public_subnets
  bastion_sg_id    = module.security.bastion_sg_id
  db_template_path = var.db_template_path
  rds_endpoint     = module.rds.rds_endpoint
  dbuser           = var.db_username
  dbpassword       = var.db_password
  username         = var.ssh_username
  private_keypath  = var.private_keypath
  rds_instance     = module.rds.rds_instance
}

# Compute - Elastic Beanstalk
module "beanstalk" {
  source = "./modules/compute/beanstalk"

  project_name        = var.project_name
  environment         = var.environment
  app_name            = var.beanstalk_app_name
  env_name            = var.beanstalk_env_name
  solution_stack_name = var.beanstalk_solution_stack
  cname_prefix        = var.beanstalk_cname_prefix
  vpc_id              = module.vpc.vpc_id
  private_subnets     = module.vpc.private_subnets
  public_subnets      = module.vpc.public_subnets
  instance_type       = var.beanstalk_instance_type
  keyname             = module.keypairs.key_name
  min_size            = var.beanstalk_min_size
  max_size            = var.beanstalk_max_size
  rds_endpoint        = module.rds.rds_endpoint
  dbname              = var.db_name
  dbuser              = var.db_username
  dbpassword          = var.db_password
  memcached_endpoint  = module.elasticache.memcached_endpoint
  rmq_endpoint        = module.amazonmq.amazonmq_broker_endpoint
  rmq_username        = var.rmq_username
  rmq_password        = var.rmq_password
  beanstalk_sg_id     = module.security.beanstalk_sg_id
  elb_sg_id           = module.security.elb_sg_id
  rds_instance        = module.rds.rds_instance
  elasticache_cluster = module.elasticache.elasticache_cluster
  amazonmq_broker     = module.amazonmq.amazonmq_broker_id
}
