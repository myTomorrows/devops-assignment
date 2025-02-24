variable "environment" {
  description = "Environment name (e.g., dev, stg, prd)"
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "vpc_cidr" {
  description = "cidr block for vpc"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "cidrs for public subnets"
  type        = list(string)
}


variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "app_version" {
  description = "App version"
  type        = string
}
