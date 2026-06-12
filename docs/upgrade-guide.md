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

Community does not become Enterprise only by entering a license key. The supported upgrade path is a reviewed migration: create a Community backup, install a clean Enterprise runtime, restore the backup, activate/verify the Enterprise license, then cut over after validation.

Community installs are intentionally placed under `/opt/batarasec-community`. Enterprise installs should use `/opt/batarasec` or another Enterprise-approved runtime directory so the migration can be reviewed and rolled back safely.

Recommended upgrade flow:

1. Back up the Community instance from `/opt/batarasec-community`.
2. Copy the backup archive to the Enterprise server or another secure location.
3. Request Enterprise access, Enterprise images, and a valid Enterprise license from BataraSec.
4. Install Enterprise into a clean runtime directory, usually `/opt/batarasec`.
5. Restore the Community backup during the Enterprise installer flow, or use the server-side restore CLI for large backups.
6. Apply or verify the Enterprise license after restore.
7. Verify health, login, project counts, vulnerability counts, scan history, agent binaries, and Enterprise-only features.
8. Keep `/opt/batarasec-community` stopped but intact until the Enterprise migration is accepted, then remove it after backup retention requirements are met.

For large backups, prefer server-side CLI restore over browser upload to avoid upload timeout, reverse-proxy limits, and memory pressure. Run the restore in `tmux` or another persistent shell session.

Do not overwrite `/opt/batarasec-community` in place for the first Enterprise migration. Side-by-side migration is safer and makes rollback possible.

Detailed Enterprise restore commands, private registry access, license activation steps, and operator checklists are provided with Enterprise access and are not published in the Community repository.
