###
# General
###

variable "enabled" {
  description = "Enable or disable this module."
  default     = true
}

variable "tags" {
  description = "Tags shared by all resources of this module. Will be merged with any other specific tags by resource."
  default     = {}
}

###
# Bastion host
###

variable "bastion_host_names" {
  description = "List of names of the Bastion Host. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "bastion_host_locations" {
  description = "List of Azure supported locations where the resource exists. Changing this forces a new resource to be created.Please refer the link for the azure locations : https://docs.microsoft.com/en-us/azure/bastion/bastion-faq"
  type        = list(string)
  default     = [""]
}

variable "bastion_host_resource_group_names" {
  description = "A list of names of the resource groups in which Bastion Host will be created."
  type        = list(string)
  default     = [""]
}

variable "ip_configurations" {
  description = "One or more IP configuration blocks."
  type        = list(list(object({ name = string, subnet_id = string, public_ip_address_id = string })))
  default     = [null]
}

variable "bastion_host_tags" {
  description = "Tag which will associated to the Bastion Host."
  default     = {}
}
