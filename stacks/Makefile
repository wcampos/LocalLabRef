.PHONY: help up-all down-all status

help:
	@echo "Docker Stacks"
	@echo "  make up-all   - Start core stacks (traefik, ollama, observability)"
	@echo "  make down-all - Stop core stacks"
	@echo "  make status   - Show running containers"
	@echo ""
	@echo "Stacks: traefik, observability, ollama, adguard, consul, dashy, n8n, portainer, vault"

up-all:
	@cd traefik && make up
	@cd ollama && make up
	@cd observability && make up

down-all:
	@cd traefik && make down
	@cd ollama && make down
	@cd observability && make down

status:
	@docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'

