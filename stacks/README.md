# Docker Stacks

Docker Compose stacks for a home lab. Each stack has its own `Makefile` and `docker-compose.yml`.

## How the Makefiles Work

Each stack Makefile follows the same pattern. From any stack directory:

| Command | Description |
|---------|-------------|
| `make help` | Show available commands |
| `make up` | Start the stack (runs `docker compose up -d`) |
| `make down` | Stop and remove containers |
| `make restart` | Restart containers |
| `make logs` | Stream logs (Ctrl+C to exit) |
| `make ps` | List containers |
| `make status` | Show containers and resource usage |

From the `stacks/` root:

| Command | Description |
|---------|-------------|
| `make up-all` | Start core stacks: traefik, ollama, observability |
| `make down-all` | Stop core stacks |
| `make status` | List all running containers |

## Getting Started

### Prerequisites

- Docker and Docker Compose installed
- For stacks that use Traefik labels: start **Traefik first** (it creates the `traefik` network)

### Start Order

Many stacks depend on the `traefik` network for routing. Start in this order:

1. **Traefik** – Creates the shared network
2. **Observability** – Prometheus, Grafana, Loki, Tempo (see [observability/README.md](observability/README.md) for architecture diagram)
3. **Ollama** – LLM server (uses traefik network)
4. Any other stack: **AdGuard**, **Consul**, **Dashy**, **n8n**, **Portainer**, **Vault**

### Quick Start

```bash
cd stacks

# Start core stacks (traefik, ollama, observability)
make up-all

# Or start individually
cd traefik && make up
cd ../observability && make up
cd ../ollama && make up
```

---

## Stack Reference

### Traefik

Reverse proxy, load balancer, and automatic SSL via Let's Encrypt.

| | |
|---|---|
| **Prerequisites** | None (start this first) |
| **Config** | Copy `.env.example` to `.env`, set `ACME_EMAIL` for SSL |
| **Access** | Dashboard: http://localhost:8080 |

```bash
cd traefik
cp .env.example .env   # edit if needed
make up
```

---

### Observability

Full observability stack: Prometheus, Loki, Tempo, Grafana, Node Exporter. See [observability/README.md](observability/README.md) for architecture diagram.

| | |
|---|---|
| **Prerequisites** | None |
| **Config** | Optional `.env` for `GRAFANA_ADMIN_PASSWORD` |
| **Access** | Grafana: http://localhost:3000 (admin/admin) |
| **Access** | Prometheus: http://localhost:9090 |

```bash
cd observability
make up
```

---

### Ollama

Local LLM server with Open WebUI.

| | |
|---|---|
| **Prerequisites** | Traefik network (`cd traefik && make up` first) |
| **Access** | API: http://localhost:11434 |
| **Access** | WebUI: http://ollama.localhost (add to `/etc/hosts`) |
| **Extra** | `make pull-model MODEL=llama3` – pull a model |
| **Extra** | `make list-models` – list installed models |

```bash
cd ollama
make up
make pull-model MODEL=llama3
```

---

### n8n

Workflow automation with PostgreSQL backend.

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Config** | Copy `.env.example` to `.env`, set `POSTGRES_PASSWORD`, `N8N_BASIC_AUTH_PASSWORD` |
| **Access** | http://localhost:5678 |

```bash
cd n8n
cp .env.example .env   # edit passwords
make up
```

---

### AdGuard Home

DNS sinkhole and ad blocker.

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Access** | Web UI: http://localhost:3001, or via Traefik at adguard.localhost |
| **Ports** | 53 (DNS), 853 (DoT), 784 (DoQ), 3001 (Web) |

```bash
cd adguard
make up
```

---

### Consul

Service discovery and configuration (single-node dev mode).

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Access** | UI: http://localhost:8500 |

```bash
cd consul
make up
```

---

### Dashy

Self-hosted dashboard to organize all your services.

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Config** | Edit `config.yml` to add your services |
| **Access** | Via Traefik at dashy.localhost |

```bash
cd dashy
# Edit config.yml to add your services
make up
```

---

### Portainer

Docker management UI.

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Access** | http://localhost:9000 or via Traefik at portainer.localhost |

```bash
cd portainer
make up
```

---

### Vault

HashiCorp Vault in dev mode (single node, in-memory). **Not for production.**

| | |
|---|---|
| **Prerequisites** | Traefik network |
| **Access** | http://localhost:8200/ui |
| **Dev token** | `dev-root-token` |

```bash
cd vault
make up
```

---

## Hosts File (Optional)

To use `*.localhost` domains via Traefik, add to `/etc/hosts`:

```
127.0.0.1 traefik.localhost ollama.localhost adguard.localhost dashy.localhost n8n.localhost portainer.localhost vault.localhost consul.localhost
```
