#Create instance required for the project by capturing ami-id dynamically using data query.
resource "aws_instance" "this" {
  count         = length(var.components) #Mandatory
  ami           = var.ami_id #Mandatory
  vpc_security_group_ids = var.sg_ids #Mandatory
  instance_type = var.instance_type #Mandatory
  tags          = var.ec2_tags #Optional
  provisioner "local-exec" {
  command = "echo The server's IP address is ${self.private_ip}"
  on_failure = continue
  }
  provisioner "local-exec" {
  command = "echo Destroyed the environment"
  on_failure = continue
  when = destroy
  }
}
