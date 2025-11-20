variable "aws_region" {
  description = "AWS region to deploy the hardened web app into."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project tag for all resources."
  type        = string
  default     = "AWS-RedHat-OWASP-Hardened-App"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "admin_cidr" {
  description = "Trusted CIDR range for SSH and administrative HTTPS access."
  type        = string
  default     = "203.0.113.0/24" # replace with your IP/CIDR
}

variable "instance_type" {
  description = "EC2 instance type for the RHEL web server."
  type        = string
  default     = "t3.small"
}

variable "rhel_ami_id" {
  description = "RHEL AMI ID to use for the EC2 instance."
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name for SSH access."
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch Logs."
  type        = number
  default     = 30
}
