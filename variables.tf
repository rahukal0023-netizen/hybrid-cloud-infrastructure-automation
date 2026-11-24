variable "location" {
  description = "Azure region for the lab resources."
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the lab resource group."
  type        = string
  default     = "rg-hybrid-infra-lab"
}

variable "vnet_address_space" {
  description = "Private address range for the lab VNet."
  type        = list(string)
  default     = ["10.40.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Private address range for the workload subnet."
  type        = list(string)
  default     = ["10.40.1.0/24"]
}
