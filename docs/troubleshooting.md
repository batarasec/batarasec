# Troubleshooting

> Draft placeholder for the public Community repository.

Useful commands:

```bash
cd /opt/batarasec-community
docker compose ps
docker compose logs api
docker compose logs web
docker compose logs worker
docker compose logs nginx
```

Common areas to check:

- Docker Engine and Compose plugin are installed.
- `.env` contains generated secrets.
- PostgreSQL and Redis containers are healthy.
- API health endpoint responds.
- Nginx can reach API and web services.
