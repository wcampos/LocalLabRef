# AdGuard Home Stack

![AdGuard](https://cdn.simpleicons.org/adguard/68BC71)

DNS sinkhole and ad blocker.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start AdGuard |
| `make down` | Stop AdGuard |
| `make restart`, `make logs`, `make ps`, `make status` | Standard commands |

## Getting Started

```bash
cd adguard
make up
```

## Access

- Web UI: http://localhost:3001
- Via Traefik: http://adguard.localhost (add to `/etc/hosts`)

## References

- [AdGuard Home](https://adguard.com/adguard-home/overview.html)
