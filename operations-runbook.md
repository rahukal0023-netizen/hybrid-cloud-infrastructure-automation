# Operations Runbook

## Daily checks
- Review Azure Service Health and resource health.
- Review VM availability and monitoring alerts (if a VM is added).
- Check disk capacity, CPU/memory trends and critical Windows services.
- Review backup job status and failed jobs.

## Weekly checks
- Review patch compliance and pending reboot state.
- Review privileged access and stale accounts in the lab directory.
- Review NSG rules and remove unnecessary access.
- Confirm monitoring data is arriving.

## Change procedure
1. Record the change, owner, impact and maintenance window.
2. Capture the current configuration and a rollback plan.
3. Test in the lab and review the deployment plan.
4. Obtain approval before production changes.
5. Implement and validate service health.
6. Record evidence and close the change.

## Incident triage
1. Confirm scope, impact and start time.
2. Check recent changes and platform health.
3. Validate network path, DNS resolution, compute and service state.
4. Collect logs and timestamps.
5. Apply an approved workaround or rollback.
6. Verify recovery and document root cause/actions.

This runbook is a template. Adapt it to the organisation's actual policies and service-level objectives.
