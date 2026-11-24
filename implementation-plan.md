# Implementation Plan

## Phase 1 — Design
- Define a dedicated lab resource group and private address space.
- Keep the first deployment to network foundations only.
- Document assumptions, access requirements, cost considerations and rollback.

## Phase 2 — Provision
- Authenticate with Azure CLI.
- Run Terraform formatting, validation and plan.
- Review all proposed resources before applying.
- Capture sanitized evidence from the Azure portal.

## Phase 3 — Operations automation
- Run the read-only health report on a Windows test machine.
- Export installed-software inventory.
- Review output for sensitive hostnames or software details before publishing.

## Phase 4 — Operational readiness
- Define monitoring thresholds and alert ownership.
- Define backup scope, retention and restore-test cadence.
- Document patch windows, change approvals and rollback steps.
- Use least-privilege RBAC and private administrative access.

## Phase 5 — Cleanup and review
- Run Terraform destroy if the lab is temporary.
- Confirm resources are removed.
- Record actual test outcomes and lessons learned.
