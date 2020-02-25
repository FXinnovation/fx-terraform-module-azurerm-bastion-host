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
# Public IP
###

variable "public_ip_enabled" {
  description = "Boolean flag which describes whether or not to enable the Public IP."
  default     = false
}

variable "public_ip_name" {
  description = "Specifies the name of the Public IP resource. Changing this forces a new resource to be created."
  default     = ""
}

variable "public_ip_location" {
  description = " Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = ""
}

variable "public_ip_resource_group_name" {
  description = "The name of the resource group in which to create the Public IP."
  default     = ""
}

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`. "
  default     = "Dynamic"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are `Basic` and `Standard`. Defaults to `Basic`."
  default     = "Basic"
}

variable "public_ip_tags" {
  description = " Tags which will be associated to the Public IP."
  default     = {}
}

###
# Bastion host
###

variable "bastion_host_name" {
  description = "List of names of the Bastion Host. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "bastion_host_location" {
  description = "List of Azure supported locations where the resource exists. Changing this forces a new resource to be created.Please refer the link for the azure locations : https://docs.microsoft.com/en-us/azure/bastion/bastion-faq"
  type        = string
  default     = ""
}

variable "bastion_host_resource_group_name" {
  description = "A list of names of the resource groups in which Bastion Host will be created."
  type        = string
  default     = ""
}

variable "ip_configurations" {
  description = "One or more IP configuration blocks."
  type        = list(object({ name = string, subnet_id = string }))
  default     = []
}

variable "bastion_host_tags" {
  description = "Tag which will associated to the Bastion Host."
  default     = {}
}
