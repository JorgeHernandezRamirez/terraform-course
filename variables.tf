variable region {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "public_ip_cidr"{
  default = "0.0.0.0/0"
}

variable "path_to_public_key" {
  default = "mykey.pub"
}