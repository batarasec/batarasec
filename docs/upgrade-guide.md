# Upgrade Guide

> Draft placeholder for the public Community repository.

## Community patch upgrades

Community upgrades should use immutable Community image tags. Back up data before every upgrade.

Basic flow:

1. Create a backup from the current Community install.
2. Update image tag values in `/opt/batarasec-community/.env`.
3. Run `docker compose pull` from `/opt/batarasec-community`.
4. Run `docker compose up -d` to recreate services.
5. Verify `/api/health`, login, projects, findings, reports, and agent status.

Do not use Enterprise, staging, or customer image tags for Community installs.

## Upgrade from Community to Enterprise

Community installs are intentionally placed under `/opt/batarasec-community`. Enterprise installs should use `/opt/batarasec` or another Enterprise-approved runtime directory so the migration can be reviewed and rolled back safely.

Recommended upgrade flow:

1. Back up the Community instance from `/opt/batarasec-community`.
2. Request or activate an Enterprise license.
3. Prepare Enterprise images, compose, and environment in `/opt/batarasec`.
4. Restore or migrate Community data into the Enterprise runtime using the approved backup/restore path.
5. Set Enterprise-only environment values, such as license and Portal/Central KB settings, only after the Enterprise runtime is ready.
6. Start Enterprise services and verify health, login, data counts, license status, and Enterprise-only features.
7. Keep `/opt/batarasec-community` stopped but intact until the Enterprise migration is accepted, then remove it after backup retention requirements are met.

Do not overwrite `/opt/batarasec-community` in place for the first Enterprise migration. Side-by-side migration is safer and makes rollback possible.
