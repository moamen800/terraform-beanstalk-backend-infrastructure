# ===================================
# SECURITY GROUPS CONFIGURATION
# ===================================

# ----------------------------
# Load Balancer Security Group
# ----------------------------

# ELB Security Group
resource "aws_security_group" "elb" {
  name_prefix = "${var.project_name}-bean-elb-sg-"
  description = "Security group for Elastic Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "${var.project_name}-bean-elb-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

# -------------------------
# Application Security Group
# -------------------------

# Beanstalk Instances Security Group
resource "aws_security_group" "beanstalk" {
  name_prefix = "${var.project_name}-prodbean-sg-"
  description = "Security group for Beanstalk instances"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from ELB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb.id]
  }

  ingress {
    description = "Allow SSH access from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "${var.project_name}-prodbean-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

# -------------------------------
# Backend Services Security Group
# -------------------------------

# Backend Security Group
resource "aws_security_group" "backend" {
  name_prefix = "${var.project_name}-backend-sg-"
  description = "Security group for backend services"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow all traffic from Beanstalk instances"
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.beanstalk.id]
  }

  ingress {
    description     = "Allow MySQL access from Bastion host"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  ingress {
    description = "Allow all traffic within backend SG"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "${var.project_name}-backend-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

# ---------------------------
# Bastion Host Security Group
# ---------------------------

# Bastion Host Security Group
resource "aws_security_group" "bastion" {
  name_prefix = "${var.project_name}-bastion-"
  description = "Security group for Bastion host"
  vpc_id      = var.vpc_id

  # SSH Access
  ingress {
    description = "Allow SSH access from allowed IPs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-bastion"
    Environment = var.environment
    Project     = var.project_name
    Terraform   = "true"
  }
}
