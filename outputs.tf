output "resource_group_name" {
  description = "Created resource group."
  value       = azurerm_resource_group.lab.name
}

output "virtual_network_name" {
  description = "Created virtual network."
  value       = azurerm_virtual_network.lab.name
}

output "subnet_id" {
  description = "Workload subnet resource ID."
  value       = azurerm_subnet.workload.id
}

output "network_security_group_id" {
  description = "Workload NSG resource ID."
  value       = azurerm_network_security_group.workload.id
}
