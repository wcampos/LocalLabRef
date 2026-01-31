.PHONY: help up down restart logs ps status

help:
	@echo "Observability Stack (Prometheus, Loki, Tempo, Grafana, Node Exporter)"
	@echo "  make up      - Start observability stack"
	@echo "  make down    - Stop observability stack"
	@echo "  make logs    - Show logs"
	@echo "  make ps      - Show containers"

up:
	docker compose up -d
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000 (admin/admin)"

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
	@docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}' $$(docker compose ps -q) 2>/dev/null || true
