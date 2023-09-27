variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "ExampleNginxContainer"
}

variable "internal_port" {
  description = "Value of internal port"
  # basic types include string, number and bool
  type        = number
  default     = 80
}


variable "external_port" {
  description = "Value of external port"
  # basic types include string, number and bool
  type        = number
  default     = 2224
}

