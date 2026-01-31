# Vault Stack

![Vault](https://cdn.simpleicons.org/vault/000000)

HashiCorp Vault in dev mode (single node, in-memory). **Not for production.**

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Vault in dev mode |
| `make down` | Stop Vault |
| `make restart`, `make logs`, `make ps` | Standard commands |

## Getting Started

```bash
cd vault
make up
```

## Access

- UI: http://localhost:8200/ui
- Dev root token: `dev-root-token`

## References

- [HashiCorp Vault](https://developer.hashicorp.com/vault)
