// Variable declarations in Terraform (see descriptions)
variable "region" {
  description = "AWS region"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}
variable "az" {
  description = "Availability zones for the subnets"
  type        = list(string)
}
variable "public_cidr" {
  description = "CIDR block for public access (SSH)"
  type        = string
}
variable "key_name" {
  description = "SSH key name for the EC2 instance"
  type        = string
}
variable "ami" {
  description = "AMI of EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
