# BataraSec Community

BataraSec Community is a self-hosted vulnerability management platform for small internal security teams. It helps teams collect scanner results, review vulnerabilities, track remediation, and run a basic VM agent workflow from a Docker Compose deployment.

> This repository is the public Community distribution repository. It provides installer, Docker Compose, documentation, and sample data. It is not a public source-code mirror of the internal BataraSec development repository.

## Quick start

```bash
git clone https://github.com/batarasec/batarasec.git
cd batarasec
bash install.sh
```

Or run Docker Compose directly after copying `.env.example` to `.env` and filling required secrets:

```bash
cp .env.example .env
docker compose up -d
```

## Included in Community

BataraSec Community is intended for small internal production deployments.

Planned Community v0.1 capabilities:

- Docker Compose self-hosted install.
- Superadmin login and basic project/workspace management.
- Scanner upload and parsing for common scanner formats.
- Vulnerability dashboard, list, detail, filters, and status handling.
- Basic assignment workflow.
- Standard PDF/reporting where available.
- Basic Linux VM agent install, enroll, scan, and Scan Now.
- Local vulnerability enrichment where available without commercial services.
- Basic backup/restore.

## Community limits

Community should be useful and reliable for small internal teams. BataraSec does not intentionally degrade Community performance with artificial CPU or memory throttling.

Planned Community limits:

| Area | Community limit |
| --- | --- |
| Organizations | 1 |
| Workspaces | 1 |
| Projects | 3 |
| Users | 5 |
| VM agents | 5 |
| Open findings | 10,000 |
| Backup retention | 3 archives |
| Reports | Standard reports only |
| Branding | BataraSec Community branding |
| Support | Community docs/issues only |

## Enterprise upgrade

BataraSec Enterprise is intended for teams that need larger scale, governance, automation, compliance evidence, integrations, branding, Portal/Central KB capabilities, fleet management, and support SLA.

Enterprise candidates include:

- Larger or license-based limits.
- Advanced RBAC, SLA, and escalation workflows.
- AI-Enhanced, executive, compliance, and branded reports.
- Portal/Central KB integration.
- Advanced agent release manager and fleet governance.
- CI/CD, Jira, Slack/Teams, SIEM, webhooks, and SSO integrations.
- Long-term retention and audit history.
- Custom branding, severity palette, and Enterprise themes.
- Priority support and deployment assistance.

## Usage terms

Community may be used for free for internal production use. Third-party SaaS/managed service, resale, fork/rebrand resale, or modified commercial redistribution are not allowed without a commercial agreement.

See [`LICENSE`](LICENSE) for the current Community terms draft.

## Documentation

- [Community install guide](docs/community-install.md)
- [First scan guide](docs/first-scan-guide.md)
- [Scanner upload guide](docs/scanner-upload-guide.md)
- [VM agent installation guide](docs/vm-agent-installation-guide.md)
- [Backup and restore](docs/backup-restore.md)
- [Upgrade guide](docs/upgrade-guide.md)
- [Troubleshooting](docs/troubleshooting.md)

## Security

Please report security issues privately. See [`SECURITY.md`](SECURITY.md).

## Contributions

Public contributions are not accepted in the near term. Issues and feedback may be opened once the public repository is ready. See [`CONTRIBUTING.md`](CONTRIBUTING.md).
