variable "name"{
    type = string
    default = "name"
}
variable "compute_count"{
    type = number
    default = "1"
    description = "specify count for resources"
}
variable "vm_ssh_public_key" {
  type = string
  description = "public key for linux vm"
}