# Traefik (Kubernetes)

![Traefik](https://cdn.simpleicons.org/traefikproxy/24A0C4)

**Traefik** is a cloud-native reverse proxy and ingress controller for Kubernetes. It discovers services automatically and handles routing, TLS, and load balancing.

## What it does

- **Ingress** – Routes external traffic to cluster services
- **TLS** – Automatic Let's Encrypt certificates (ACME)
- **Dashboard** – Web UI for monitoring and inspection
- **Metrics** – Prometheus-compatible metrics

## Prerequisites

- Traefik CRD provider (IngressRoute, Middleware, etc.) installed
- Optional: cert-manager for TLS via Ingress annotations

## Deploy

```bash
kubectl apply -k .
```

Edit `configmap.yaml` to set `YOUR_ACME_EMAIL@example.com` for Let's Encrypt before production.

## References

- [Traefik](https://traefik.io/)
