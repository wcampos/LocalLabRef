# Ansible Makefile
# https://docs.ansible.com/ansible/latest/index.html

.PHONY: help install check syntax lint run run-playbook run-check ping clean

ANSIBLE_PLAYBOOK := ansible-playbook
ANSIBLE_GALAXY := ansible-galaxy
ANSIBLE_LINT := ansible-lint
INVENTORY := inventory/hosts.yml
PLAYBOOK := playbooks/site.yml

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-16s %s\n", $$1, $$2}'

install: ## Install Galaxy requirements (ansible.posix)
	$(ANSIBLE_GALAXY) install -r requirements.yml

check: syntax lint ## Run all checks

syntax: ## Check playbook syntax (PLAYBOOK=playbooks/site.yml)
	$(ANSIBLE_PLAYBOOK) --syntax-check $(PLAYBOOK) -i $(INVENTORY)

lint: ## Lint with ansible-lint
	@command -v $(ANSIBLE_LINT) > /dev/null && $(ANSIBLE_LINT) . || echo "ansible-lint not installed"

run: ## Run site playbook
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) -i $(INVENTORY)

run-playbook: ## Run playbook (PLAYBOOK=playbooks/mount-volumes.yml)
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) -i $(INVENTORY)

run-check: ## Run in check mode (dry-run)
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) -i $(INVENTORY) --check

ping: ## Test connectivity
	$(ANSIBLE_PLAYBOOK) -i $(INVENTORY) -m ping all

clean: ## Clean cache and retry files
	rm -rf .ansible/
	find . -type f -name "*.retry" -delete 2>/dev/null || true
