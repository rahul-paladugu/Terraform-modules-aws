#Create a security group for the project update the ports using Dynamic Block
resource "aws_security_group" "expense_sg" {
  name        = "allow-limited-access"
  description = "Allow expense inbound and outbound traffic"
  dynamic "egress" {
  for_each = var.sg_ports
  content {
    from_port        = egress.value
    to_port          = egress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }
  dynamic "ingress" {
  for_each = var.sg_ports
  content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }
  tags = var.sg_tags
}