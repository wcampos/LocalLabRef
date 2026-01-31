.PHONY: help up down restart logs ps status

help:
	@echo "Dashy Stack"
	@echo "  make up      - Start Dashy"
	@echo "  Edit config.yml to add your services"

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
