# AdGuard Home (Kubernetes)

![AdGuard](https://cdn.simpleicons.org/adguard/68BC71)

**AdGuard Home** is a network-wide DNS sinkhole and ad blocker. It blocks ads, trackers, and malicious domains at the DNS level for your entire network.

## What it does

- **DNS sinkhole** – Filters DNS requests before they reach the internet
- **Ad blocking** – Blocks ads, trackers, and analytics
- **Web UI** – Configure blocklists, view statistics, manage clients
- **Custom rules** – Add allowlists and blocklists

## Prerequisites

- StorageClass and PV for the PVC, or a default provisioner (e.g. MicroK8s hostpath)

## Deploy

```bash
kubectl apply -k .
```

## Access

- Ingress: http://adguard.localhost.dev (via Traefik)
- Or port-forward: `kubectl port-forward svc/adguard -n adguard 3000:3000`

## References

- [AdGuard Home](https://adguard.com/adguard-home/overview.html)
