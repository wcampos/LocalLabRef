# n8n Stack

![n8n](https://cdn.simpleicons.org/n8n/FF6D5A)

Workflow automation platform with PostgreSQL backend.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start n8n + PostgreSQL (auto-copies `.env.example` if no `.env`) |
| `make down` | Stop services |
| `make restart`, `make logs`, `make ps` | Standard commands |

## Getting Started

```bash
cd n8n
cp .env.example .env
# Edit .env: set POSTGRES_PASSWORD, N8N_BASIC_AUTH_PASSWORD
make up
```

## Access

- UI: http://localhost:5678

## References

- [n8n](https://n8n.io/)
