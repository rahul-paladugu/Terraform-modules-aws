variable "components" {
  type = list 
  description = "Please mention the servers that needs to be created"
}

variable "ami_id" {
  type = string
  description = "AMI-ID of the servers"
}

variable "sg_ids" {
  type = list
  description = "security group id's"
}

variable "instance_type" {
  type = string
  description = "Type of instance we use in the environments"
  validation {
    condition = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Please select only either t3.micro or t3.small"
  }
}

variable "ec2_tags" {
  type = map 
  description = "tags for the instances created"
  default = {}
}

variable "zone_id" {
  type = string
  description = "zone_id of the project"
}

variable "r53_project_name" {
  type = string
  description = "Please mention your project name"
}

variable "public_r53_name" {
  type = string
  description = "name we configure to access the application"
}

variable "sg_tags" {
  type = map
  description = "tags to add to security group"
  default = {}
}

variable "sg_ports" {
  type = list
  description = "Ports that needs to be opened"
}