# Consul Stack

![Consul](https://cdn.simpleicons.org/consul/F24C53)

Service discovery and configuration. Single-node dev mode.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Consul |
| `make down` | Stop Consul |
| `make restart`, `make logs`, `make ps` | Standard commands |

## Getting Started

```bash
cd consul
make up
```

## Access

- UI: http://localhost:8500

## References

- [Consul](https://www.consul.io/)
