// AWS region where resources will be deployed
region = "eu-central-1"

// Default CIDR block for the VPC
vpc_cidr = "172.31.0.0/16"

// List of default CIDR blocks for subnets
subnet_cidrs = [
  "172.31.0.0/20",  //  eu-central-1a
  "172.31.16.0/20", //  eu-central-1b
  "172.31.32.0/20"  //  eu-central-1c
]

// List of availability zones for subnets
az = [
  "eu-central-1a",
  "eu-central-1b",
  "eu-central-1c"
]

// Public CIDR block (uni network)
public_cidr = "149.201.0.0/16"

// Defined SSH key
key_name = "ha-cloud"

// AMI with OS of the EC2 instance 
ami = "ami-0584590e5f0e97daa"

// EC2 instance type
instance_type = "t2.micro"
