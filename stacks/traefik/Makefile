.PHONY: help up down restart logs ps status

help:
	@echo "Traefik Stack"
	@echo "  make up      - Start Traefik"
	@echo "  make down    - Stop Traefik"
	@echo "  make restart - Restart Traefik"
	@echo "  make logs    - Show logs"
	@echo "  make ps      - Show containers"

up:
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

status:
	@docker compose ps
	@echo ""
	@docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}' $$(docker compose ps -q) 2>/dev/null || true
