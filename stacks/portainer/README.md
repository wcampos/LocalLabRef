# Portainer Stack

![Portainer](https://cdn.simpleicons.org/portainer/13BEF9)

Docker container management UI.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Portainer |
| `make down` | Stop Portainer |
| `make restart`, `make logs`, `make ps` | Standard commands |

## Getting Started

```bash
cd portainer
make up
```

## Access

- Direct: http://localhost:9000
- Via Traefik: http://portainer.localhost (add to `/etc/hosts`)

## References

- [Portainer](https://www.portainer.io/)
