# Ollama (Kubernetes)

![Ollama](https://cdn.simpleicons.org/ollama/000000)

**Ollama** is a local LLM server that runs open-source models (Llama, Mistral, CodeLlama, etc.) on your own hardware. No cloud required.

## What it does

- **Local inference** – Run LLMs on your cluster or workstation
- **REST API** – OpenAI-compatible API at `/api/chat` and `/api/generate`
- **Model management** – Pull, list, and remove models via CLI or API
- **GPU support** – Add `nvidia.com/gpu` to deployment resources for GPU acceleration

## Prerequisites

- StorageClass for PVCs (models and data can be large)
- Optional: NVIDIA device plugin and GPU nodes

## Deploy

```bash
kubectl apply -k .
```

## Pull models

```bash
kubectl exec -it deployment/ollama -n ollama -- ollama pull llama3
```

## Access

- Ingress: http://ollama.localhost.dev (via Traefik)
- API: `http://ollama.ollama:11434` (in-cluster)

## References

- [Ollama](https://ollama.com/)
