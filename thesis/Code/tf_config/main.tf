// Prerequisites for Terraform in main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.77"
    }
  }
  required_version = ">= 1.2.0"
}
provider "aws" {
  region = var.region
}

// Definition of the EC2 instance as resource with all the needed infrastructure 
resource "aws_instance" "ec2_vm" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.ha_sg.id]

  user_data = "${file("ec2setup.sh")}"

  tags = {
    Name = "HomeAssistantCloudInstance"
  }
}
// Terraform output value for the public IP of the instance
output "ec2_public_ip" {
  description = "Public IP for ssh access"
  value       = aws_instance.ec2_vm.public_ip
}
