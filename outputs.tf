###
# Bastion host
###

output "bastion_host_ids" {
  description = "The IDs of the Bastion Host."
  value       = compact(concat(azurerm_bastion_host.this.*.id, [""]))
}

output "bastion_host_dns_names" {
  description = "The FQDNs for the Bastion Host."
  value       = compact(concat(azurerm_bastion_host.this.*.dns_name, [""]))
}
