.PHONY: help up down restart logs ps status

help:
	@echo "n8n Stack"
	@echo "  make up      - Start n8n + PostgreSQL"
	@echo "  Copy .env.example to .env and set passwords"

up:
	@docker network inspect traefik >/dev/null 2>&1 || (echo "Create traefik network first"; exit 1)
	@test -f .env || cp .env.example .env
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

ps:
	docker compose ps
