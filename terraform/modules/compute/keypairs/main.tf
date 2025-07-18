# ===================================
# SSH KEY PAIR CONFIGURATION
# ===================================

# ----------------------------
# SSH Key Pair for EC2 Instances
# ----------------------------
resource "aws_key_pair" "keypair_ssh" {
  key_name   = var.key_name
  public_key = file("${path.module}/keys/keypair_ssh.pub")

  tags = {
    Name        = var.key_name
    Environment = var.environment
    Project     = var.project_name
  }
}
