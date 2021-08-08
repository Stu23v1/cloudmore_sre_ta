variable "ssh_user" {
  description = "Account used for support and maintanence"
  type        = string
  default     = "azureuser"
}

variable "ssh_user_rsa_pub_path" {
  description = ""
  type        = string
  default     = "~/.ssh/id_rsa_cloudmore.pub"
}
