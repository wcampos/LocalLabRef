# Dashy (Kubernetes)

![Dashy](https://cdn.simpleicons.org/dashy/00D9FF)

**Dashy** is a self-hosted dashboard that organizes and provides quick access to all your services, apps, and links in one place.

## What it does

- **Unified dashboard** – Single page to reach Traefik, Grafana, Prometheus, etc.
- **Customizable** – Edit the ConfigMap to add or remove services
- **Responsive** – Works on desktop and mobile
- **Themes** – Multiple layout and theme options

## Deploy

```bash
kubectl apply -k .
```

Edit `configmap.yaml` to add your own services and links. Default config includes Traefik, Grafana, and Prometheus.

## Access

- Ingress: http://dashy.localhost.dev (via Traefik)

## References

- [Dashy](https://dashy.to/)
