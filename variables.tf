variable "vpc_cidr" {
  type    = string
  default = "10.123.0.0/16"
}

variable "access_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "main_vol_size" {
  type    = number
  default = 8
}


variable "instance_count" {
  type    = number
  default = 2
}

variable "key_name" {
  type    = string
  default = "mtc_key_kp"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/ec2-kp.pub"
}


variable "region" {
  default = "us-west-1"
}
