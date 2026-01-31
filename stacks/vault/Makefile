.PHONY: help up down restart logs ps status

help:
	@echo "Vault Stack (dev mode)"
	@echo "  make up      - Start Vault in dev mode"
	@echo "  Dev token: dev-root-token"

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
