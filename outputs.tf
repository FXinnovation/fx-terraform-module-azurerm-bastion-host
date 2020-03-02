###
# Bastion host
###

output "bastion_host_id" {
  description = "The IDs of the Bastion Host."
  value       = element(concat(azurerm_bastion_host.this.*.id, list("")), 0)
}

output "bastion_host_dns_name" {
  description = "The FQDNs for the Bastion Host."
  value       = element(concat(azurerm_bastion_host.this.*.dns_name, list("")), 0)
}

###
# Public IP
###

output "public_ip_id" {
  value = element(concat(azurerm_public_ip.this.*.id, list("")), 0)
}
