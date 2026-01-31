# Ollama Stack

![Ollama](https://cdn.simpleicons.org/ollama/000000)

Local LLM server with Open WebUI.

## Prerequisites

- Traefik stack running (`cd ../traefik && make up`)

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make up` | Start Ollama + WebUI |
| `make down` | Stop services |
| `make pull-model MODEL=llama3` | Pull a model |
| `make list-models` | List installed models |
| `make logs`, `make ps`, `make status` | Standard commands |

## Getting Started

```bash
cd ollama
make up
make pull-model MODEL=llama3
```

## Access

- API: http://localhost:11434
- WebUI: http://ollama.localhost (add `127.0.0.1 ollama.localhost` to `/etc/hosts`)

## References

- [Ollama](https://ollama.com/)
