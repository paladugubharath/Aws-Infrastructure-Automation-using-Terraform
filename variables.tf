variable "region" {}
variable "ami_id" {}
variable "key_name" {}

variable "db_username" {
  sensitive = true
}

variable "db_password" {
  sensitive = true
}

variable "sns_email" {}