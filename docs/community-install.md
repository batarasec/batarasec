# Community Install Guide

> Draft placeholder for the public Community repository.

## Requirements

- Linux server with Docker Engine and Docker Compose plugin.
- Root or sudo access.
- Outbound internet access to pull container images.
- Recommended: 2 CPU cores, 4 GB RAM, and 30 GB disk for small deployments.

## Install

```bash
git clone https://github.com/batarasec/batarasec.git
cd batarasec
sudo bash install.sh
```

The installer creates `/opt/batarasec-community`, generates secrets, starts Docker Compose services with project name `batarasec-community`, and prints the superadmin credentials. This path is intentionally separate from `/opt/batarasec`, which is reserved for internal/Enterprise deployments.

## Direct Docker Compose

```bash
cp .env.example .env
# edit .env and replace secrets
docker compose up -d
```

## Post-install

- Open `http://localhost:8088` or your configured server URL.
- Login with the generated superadmin account.
- Create a project.
- Upload a sample scan or install a VM agent.
