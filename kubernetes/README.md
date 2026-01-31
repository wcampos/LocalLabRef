# Kubernetes Manifests

Raw Kubernetes manifests and Kustomize overlays (not Helm charts). Designed for ArgoCD GitOps deployment.

## Applications

| App | Description |
|-----|-------------|
| ![Argo](https://cdn.simpleicons.org/argo/EF7B4D) [argocd/](argocd/) | GitOps CD – declarative app sync from Git |
| ![Traefik](https://cdn.simpleicons.org/traefikproxy/24A0C4) [apps/traefik/](apps/traefik/) | Reverse proxy and ingress controller |
| ![AdGuard](https://cdn.simpleicons.org/adguard/68BC71) [apps/adguard/](apps/adguard/) | DNS sinkhole and ad blocker |
| ![Dashy](https://cdn.simpleicons.org/dashy/00D9FF) [apps/dashy/](apps/dashy/) | Self-hosted dashboard for services |
| ![n8n](https://cdn.simpleicons.org/n8n/FF6D5A) [apps/n8n/](apps/n8n/) | Workflow automation with PostgreSQL |
| ![Ollama](https://cdn.simpleicons.org/ollama/000000) [apps/ollama/](apps/ollama/) | Local LLM server |
| ![Prometheus](https://cdn.simpleicons.org/prometheus/E6522C) [apps/observability/](apps/observability/) | Prometheus, Loki, Tempo, Grafana, Node Exporter |
| ![Let's Encrypt](https://cdn.simpleicons.org/letsencrypt/003A70) [cluster/cert-manager/](cluster/cert-manager/) | Let's Encrypt ClusterIssuer |
| ![Kubernetes](https://cdn.simpleicons.org/kubernetes/326CE5) [cluster/storage/](cluster/storage/) | Local StorageClass |

## Structure

```
kubernetes/
├── argocd/                 # ArgoCD bootstrap, projects, applications
│   ├── namespace.yaml
│   ├── core-project.yaml
│   ├── install.sh
│   └── *-application.yaml  # ArgoCD Applications (point to apps/)
├── apps/                   # Application deployments
│   ├── traefik/
│   ├── adguard/
│   ├── dashy/
│   ├── n8n/
│   ├── ollama/
│   └── observability/
└── cluster/                # Cluster-wide resources
    ├── cert-manager/       # Let's Encrypt ClusterIssuer
    └── storage/            # StorageClass
```

## Labels (Best Practices)

All manifests use [Kubernetes recommended labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/):

- `app.kubernetes.io/name` – Application name
- `app.kubernetes.io/component` – Component within the app (e.g., ingress, database)
- `app.kubernetes.io/part-of` – Parent application
- `app.kubernetes.io/managed-by` – kustomize

## Deploy Order

1. `kubernetes/cluster/storage` – StorageClass (if using local PVs)
2. `kubernetes/argocd` – ArgoCD install (`./install.sh`)
3. `kubernetes/apps/traefik` – Traefik (Ingress)
4. `kubernetes/apps/observability` – Monitoring
5. Other apps: adguard, dashy, ollama, n8n

## Deploy Commands

```bash
# Install ArgoCD
./argocd/install.sh

# Deploy Traefik
kubectl apply -k apps/traefik

# Deploy observability
kubectl apply -k apps/observability

# Deploy cluster resources
kubectl apply -f cluster/storage/
kubectl apply -f cluster/cert-manager/
```

## Secrets

Create secrets before deploying:

- **n8n**: `n8n-postgres`, `n8n-auth` (see `apps/n8n/secret.yaml.example`)
- **cert-manager**: `cloudflare-api-token` (for DNS challenge)
