# Traefik Stack

![Traefik](https://cdn.simpleicons.org/traefikproxy/24A0C4)

Reverse proxy with Docker provider, Let's Encrypt, and Prometheus metrics. **Start this stack first**—it creates the `traefik` network used by other stacks.

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Traefik (auto-copies `.env.example` if no `.env`) |
| `make down` | Stop and remove containers |
| `make restart` | Restart containers |
| `make logs` | Stream logs |
| `make ps` | List containers |
| `make status` | Containers + resource usage |

## Getting Started

```bash
cd traefik
cp .env.example .env
# Edit .env: set ACME_EMAIL for SSL, optionally CF_DNS_API_TOKEN for Cloudflare DNS challenge
make up
```

## Access

- Dashboard: http://localhost:8080 (when `TRAEFIK_DASHBOARD_INSECURE=true`)

## References

- [Traefik](https://traefik.io/)
