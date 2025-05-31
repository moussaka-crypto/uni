// Define AWS security group for the ports 22 and 8123
resource "aws_security_group" "ha_sg" {
  name   = "HomeAssistant-SG"
  description = "Allow port 22 and 8123 inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "HomeAssistant-SG"
  }
}

// Define incoming traffic rules for ports 22 and 8123
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ha_sg.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_ha_client" {
  security_group_id = aws_security_group.ha_sg.id
  cidr_ipv4         = aws_vpc.main_vpc.cidr_block
  from_port         = 8123
  ip_protocol       = "tcp"
  to_port           = 8123
}

// Define outgoing traffic rule for all ports
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ha_sg.id
  cidr_ipv4         = var.public_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}