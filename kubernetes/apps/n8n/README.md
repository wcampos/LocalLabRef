# n8n (Kubernetes)

![n8n](https://cdn.simpleicons.org/n8n/FF6D5A)

**n8n** is a fair-code licensed workflow automation platform. It lets you connect apps and services with nodes to automate tasks, sync data, and build integrations—similar to Zapier but self-hosted.

## What it does

- **Workflow automation** – Create workflows with a visual editor
- **Integrations** – 400+ built-in nodes (HTTP, Slack, GitHub, databases, etc.)
- **Self-hosted** – Full control over your data
- **PostgreSQL** – Uses PostgreSQL for workflow storage

## Prerequisites

Create secrets before deploying:

```bash
kubectl create secret generic n8n-postgres -n n8n \
  --from-literal=POSTGRES_DB=n8n \
  --from-literal=POSTGRES_USER=n8n \
  --from-literal=POSTGRES_PASSWORD=change-me

kubectl create secret generic n8n-auth -n n8n \
  --from-literal=N8N_BASIC_AUTH_USER=admin \
  --from-literal=N8N_BASIC_AUTH_PASSWORD=change-me
```

See `secret.yaml.example` for details.

## Deploy

```bash
kubectl apply -k .
```

## Access

- Ingress: https://n8n.localhost.dev (via Traefik)
- Edit `configmap.yaml` to change `N8N_HOST` and `WEBHOOK_URL` for your domain.

## References

- [n8n](https://n8n.io/)
