.PHONY: help up down restart logs ps pull-model list-models status

help:
	@echo "Ollama Stack"
	@echo "  make up         - Start Ollama + WebUI"
	@echo "  make down       - Stop services"
	@echo "  make pull-model MODEL=llama3 - Pull a model"
	@echo "  make list-models - List models"

up:
	@docker network inspect traefik >/dev/null 2>&1 || (echo "Create traefik network first: cd ../traefik && make up"; exit 1)
	docker compose up -d
	@echo "Ollama API: http://localhost:11434"
	@echo "WebUI: http://ollama.localhost (add to /etc/hosts or use traefik)"

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

ps:
	docker compose ps

pull-model:
	@test -n "$(MODEL)" || (echo "Usage: make pull-model MODEL=llama3"; exit 1)
	docker compose exec ollama ollama pull $(MODEL)

list-models:
	docker compose exec ollama ollama list

status:
	@docker compose ps
	@docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}' $$(docker compose ps -q) 2>/dev/null || true
