# Validation Checklist

## Terraform
- [ ] Azure CLI is authenticated to the intended subscription.
- [ ] `terraform fmt -check` succeeds.
- [ ] `terraform validate` succeeds.
- [ ] Plan contains only the expected resource group, VNet, subnet, NSG and association.
- [ ] No public management ports or public IPs are introduced.
- [ ] Outputs match the deployed resource names.

## PowerShell
- [ ] Script runs on a supported Windows test machine.
- [ ] Report includes OS, uptime, CPU snapshot, memory and fixed disks.
- [ ] Service states are reported without changing service configuration.
- [ ] Output is reviewed for sensitive data before publishing.

## Portfolio evidence
- [ ] Screenshots are genuine and captured from your own lab.
- [ ] Tenant IDs, subscription IDs, usernames, hostnames and IPs are masked.
- [ ] Actual test date and environment are documented.
- [ ] No production/customer information is included.
