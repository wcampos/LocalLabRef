.PHONY: help up down restart logs ps status

help:
	@echo "Portainer Stack"
	@echo "  make up      - Start Portainer"

up:
	@docker network inspect traefik >/dev/null 2>&1 || (echo "Create traefik network first"; exit 1)
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

ps:
	docker compose ps
