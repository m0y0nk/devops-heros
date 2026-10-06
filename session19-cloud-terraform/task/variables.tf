variable "aws_region" {
  description = "AWS region where the lab infrastructure will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Lowercase project prefix used in AWS resource names and tags."
  type        = string
  default     = "session19-cloud-lab"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,19}$", var.project_name))
    error_message = "project_name must be 3-20 lowercase letters, digits, or hyphens and start with a letter."
  }
}

variable "instance_type" {
  description = "EC2 instance type for the demo web server."
  type        = string
  default     = "t3.micro"
}
