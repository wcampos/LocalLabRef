# Cert-Manager (Cluster)

![Let's Encrypt](https://cdn.simpleicons.org/letsencrypt/003A70)

**cert-manager** automates certificate issuance and renewal in Kubernetes. This directory provides a ClusterIssuer for Let's Encrypt using the Cloudflare DNS-01 challenge.

## What it does

- **TLS certificates** – Automatic issuance and renewal from Let's Encrypt
- **DNS-01 challenge** – Works with Cloudflare (no need to expose HTTP)
- **ClusterIssuer** – Cluster-wide issuer usable by any namespace

## Prerequisites

1. Install cert-manager: `kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.0/cert-manager.yaml`
2. Create Cloudflare API token secret:
   ```bash
   kubectl create secret generic cloudflare-api-token -n cert-manager \
     --from-literal=api-token=YOUR_CLOUDFLARE_API_TOKEN
   ```
3. Update `clusterissuer.yaml` with your ACME email.

## Deploy

```bash
kubectl apply -f namespace.yaml
kubectl apply -f clusterissuer.yaml
```

## References

- [cert-manager](https://cert-manager.io/) · [Let's Encrypt](https://letsencrypt.org/)
