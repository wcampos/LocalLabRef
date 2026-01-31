# Dashy Stack

![Dashy](https://cdn.simpleicons.org/dashy/00D9FF)

Self-hosted dashboard to organize and access all your services.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Dashy |
| `make down` | Stop Dashy |
| `make restart`, `make logs`, `make ps` | Standard commands |

## Getting Started

```bash
cd dashy
# Edit config.yml to add your services
make up
```

## Access

- Via Traefik: http://dashy.localhost (add to `/etc/hosts`)

## References

- [Dashy](https://dashy.to/)
