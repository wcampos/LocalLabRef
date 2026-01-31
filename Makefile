.PHONY: help ansible kubernetes stacks lint validate

help: ## Show this help
	@echo "LocalLabRef - Infrastructure Reference"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'
	@echo ""
	@echo "Subdirectories:"
	@echo "  ansible/     - Base system, Docker, MicroK8s, kubectl"
	@echo "  kubernetes/  - ArgoCD, apps, cluster (K8s manifests)"
	@echo "  stacks/      - Docker Compose (Traefik, Observability, Ollama)"

ansible: ## Run Ansible site playbook
	cd ansible && make run

kubernetes-argocd: ## Install ArgoCD
	cd kubernetes/argocd && ./install.sh

kubernetes-traefik: ## Deploy Traefik to cluster
	kubectl apply -k kubernetes/apps/traefik

kubernetes-observability: ## Deploy observability stack to cluster
	kubectl apply -k kubernetes/apps/observability

stacks: ## Start all Docker stacks
	cd stacks && make up-all

stacks-down: ## Stop all Docker stacks
	cd stacks && make down-all

lint: ## Lint Ansible and YAML
	@if command -v ansible-lint >/dev/null 2>&1; then cd ansible && ansible-lint .; fi
	@if command -v yamllint >/dev/null 2>&1; then yamllint -d '{extends: default, rules: {line-length: {max: 200}}}' ansible/ kubernetes/ stacks/ 2>/dev/null || true; fi

validate: ## Validate Docker Compose files
	@for f in stacks/traefik/docker-compose.yml stacks/ollama/docker-compose.yml stacks/observability/docker-compose.yml; do \
		docker compose -f $$f config >/dev/null 2>&1 && echo "OK $$f" || echo "FAIL $$f"; \
	done
