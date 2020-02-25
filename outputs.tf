###
# Bastion host
###

output "bastion_host_id" {
  description = "The IDs of the Bastion Host."
  value       = compact(concat(azurerm_bastion_host.this.0.id, [""]))
}

output "bastion_host_dns_name" {
  description = "The FQDNs for the Bastion Host."
  value       = compact(concat(azurerm_bastion_host.this.0.dns_name, [""]))
}

###
# Public IP
###

output "public_ip_id" {
  value = compact(concat(azurerm_public_ip.this.0.id, [""]))
}
