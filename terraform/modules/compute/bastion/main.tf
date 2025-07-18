# ===================================
# BASTION HOST CONFIGURATION
# ===================================

# -------------------
# Bastion EC2 Instance
# -------------------
resource "aws_instance" "vprofile-bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.instance_type
  key_name                    = var.keyname
  subnet_id                   = var.public_subnets[0]
  count                       = var.instance_count
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true

  tags = {
    Name        = format("%s-bastion-%02d", var.project_name, count.index + 1)
    Environment = var.environment
    Project     = var.project_name
  }

  # Database Setup Script
  provisioner "file" {
    content = templatefile(var.db_template_path, {
      rds-endpoint = split(":", var.rds_endpoint)[0]
      dbuser       = var.dbuser
      dbpass       = var.dbpassword
    })
    destination = "/tmp/vprofile-dbdeploy.sh"
  }

  # Execute Database Setup
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/vprofile-dbdeploy.sh",
      "echo 'Waiting 60 seconds for RDS instance to be fully ready...'",
      "sleep 60",
      "sudo /tmp/vprofile-dbdeploy.sh"
    ]
  }

  # SSH Connection Configuration
  connection {
    user        = var.username
    private_key = file(var.private_keypath)
    host        = self.public_ip
  }

  depends_on = [var.rds_instance]
}
