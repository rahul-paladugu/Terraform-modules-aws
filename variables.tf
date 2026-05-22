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

