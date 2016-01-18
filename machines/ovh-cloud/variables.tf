# Size of the cluster

variable "nb_keystores" {
  default = 1
}

variable "nb_masters" {
  default = 1
}

variable "nb_nodes" {
  default = 1
}

variable "prefix" {
  default = "$PREFIX"
}

# Default image

variable "image" {
  default = "Ubuntu 15.10"
}

variable "flavor" {
  default = "eg-7"
  #default = "vps-ssd-1"
}

variable "region" {
  default = "GRA1"
}