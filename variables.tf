variable "region" {
  type = string
  default = "us-east-1"
}

variable "name" {
  type = string
  default = "davidle"

}

variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type = list
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  type = string
  default = true
}

variable "enable_vpn_gateway" {
  type = string
  default = true
}