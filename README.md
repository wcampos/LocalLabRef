# LocalLabRef

These are reference infrastructure examples from my local home lab (Neuro-XCoreLab), where I experiment with and validate patterns using Ansible, Argo CD, Kubernetes, and Docker-based stacks.

I'm sharing these examples so others can explore, test, and adapt the same approaches in their own lab environments. Everything here is intentionally sanitized and designed for learning and experimentation—no secrets, credentials, or environment-specific data are included.

## Structure

| Directory | Description |
|-----------|-------------|
| **ansible/** | Base system, Docker, Ollama, MicroK8s, kubectl, mount-volumes |
| **kubernetes/** | ArgoCD, apps (Traefik, AdGuard, Dashy, Ollama, n8n, Observability), cluster (cert-manager, storage) |
| **stacks/** | Docker Compose: Traefik, Observability, Ollama, AdGuard, Consul, Dashy, n8n, Portainer, Vault |

## Quick Start

### Docker Stacks

```bash
cd stacks
make up-all
# Or individually: cd traefik && make up
```

See [stacks/README.md](stacks/README.md) for Makefile commands, start order, and per-stack setup.

| Service | URL |
|---------|-----|
| Traefik | http://localhost:8080 |
| Ollama API | http://localhost:11434 |
| Grafana (Observability) | http://localhost:3000 (admin/admin) |
| Prometheus | http://localhost:9090 |
| n8n | http://localhost:5678 |
| Consul | http://localhost:8500 |
| AdGuard | http://localhost:3001 |
| Vault | http://localhost:8200 |

### Ansible (Ubuntu/Debian)

```bash
cd ansible
ansible-galaxy install -r requirements.yml
make run
```

### Kubernetes + ArgoCD

```bash
./kubernetes/argocd/install.sh
kubectl apply -k kubernetes/apps/traefik
kubectl apply -k kubernetes/apps/observability
# Update repo URL in kubernetes/argocd/*-application.yaml
```

See [kubernetes/README.md](kubernetes/README.md) for structure and deploy order.

## Customize

- **ansible/inventory/hosts.yml** – target hosts
- **ansible/ansible.cfg** – remote_user
- **stacks/*/.env** – copy from .env.example, set ACME_EMAIL, CF_DNS_API_TOKEN, passwords, etc.
- **kubernetes/apps/traefik/configmap.yaml** – ACME email for Let's Encrypt

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and [SECURITY.md](SECURITY.md) for vulnerability reporting.

## License

MIT
